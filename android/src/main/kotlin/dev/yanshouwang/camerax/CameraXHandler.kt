package dev.yanshouwang.camerax

import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.content.pm.PackageManager
import android.util.Log
import android.view.Surface
import androidx.annotation.NonNull
import androidx.camera.core.*
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.lifecycle.LifecycleOwner
import androidx.lifecycle.Observer
import com.google.mlkit.vision.barcode.BarcodeScanning
import com.google.mlkit.vision.common.InputImage
import io.flutter.plugin.common.*
import io.flutter.view.TextureRegistry

class CameraXHandler(private val activity: Activity, private val textureRegistry: TextureRegistry)
    : MethodChannel.MethodCallHandler, EventChannel.StreamHandler, PluginRegistry.RequestPermissionsResultListener {
    companion object {
        private const val CAMERA_REQUEST_CODE = 1993
        private val PERMISSIONS_REQUIRED = arrayOf(Manifest.permission.CAMERA)
    }

    private var events: EventChannel.EventSink? = null
    private var instanceId: Int? = null
    private var listener: PluginRegistry.RequestPermissionsResultListener? = null
    private var cameraProvider: ProcessCameraProvider? = null
    private var camera: Camera? = null
    private var textureEntry: TextureRegistry.SurfaceTextureEntry? = null
    private var textureId: Long? = null
    private var size: Map<String, Double>? = null

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "state" -> stateNative(result)
            "request" -> requestNative(result)
            "init" -> initNative(call, result)
            "torch" -> torchNative(call, result)
            "dispose" -> disposeNative(call, result)
            else -> result.notImplemented()
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        instanceId = arguments as Int
        this.events = events
    }

    override fun onCancel(arguments: Any?) {
        val id = arguments as Int
        if (id != instanceId){
            return
        }
        events = null
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>?, grantResults: IntArray?): Boolean {
        return listener?.onRequestPermissionsResult(requestCode, permissions, grantResults) ?: false
    }

    private fun stateNative(result: MethodChannel.Result) {
        // Can't get exact denied or not_determined state without request. Just return not_determined when state isn't authorized
        val state =
                if (ContextCompat.checkSelfPermission(activity, Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED) 1
                else 0
        result.success(state)
    }

    private fun requestNative(result: MethodChannel.Result) {
        if (listener != null) {
            result.error("REQUEST DUPLICATED", null, null)
        } else {
            listener = PluginRegistry.RequestPermissionsResultListener { requestCode, _, grantResults ->
                if (requestCode != CAMERA_REQUEST_CODE) {
                    false
                } else {
                    val authorized = grantResults[0] == PackageManager.PERMISSION_GRANTED
                    result.success(authorized)
                    listener = null
                    true
                }
            }
            ActivityCompat.requestPermissions(activity, PERMISSIONS_REQUIRED, CAMERA_REQUEST_CODE)
        }
    }

    private fun initNative(call: MethodCall, result: MethodChannel.Result) {
        if (cameraProvider != null) {
            closeCamera()
        }
        val future = ProcessCameraProvider.getInstance(activity)
        val executor = ContextCompat.getMainExecutor(activity)
        future.addListener({
            cameraProvider = future.get()
            val selector =
                    if (call.arguments == 0) CameraSelector.DEFAULT_FRONT_CAMERA
                    else CameraSelector.DEFAULT_BACK_CAMERA
            openCamera(selector)
            val answer = mapOf("textureId" to textureId, "size" to size, "torchable" to camera!!.torchable)
            result.success(answer)
        }, executor)
    }

    private fun torchNative(call: MethodCall, result: MethodChannel.Result) {
        val state = call.arguments == 1
        camera!!.cameraControl.enableTorch(state)
        result.success(null)
    }

    private fun disposeNative(call: MethodCall, result: MethodChannel.Result) {
        val id = call.arguments as Int
        if (id == instanceId) {
            closeCamera()
            instanceId = null
        }
        result.success(null)
    }

    private fun openCamera(selector: CameraSelector) {
        textureEntry = textureRegistry.createSurfaceTexture()
        textureId = textureEntry!!.id()
        val executor = ContextCompat.getMainExecutor(activity)
        // Preview
        val surfaceProvider = Preview.SurfaceProvider { request ->
            val resolution = request.resolution
            val texture = textureEntry!!.surfaceTexture()
            texture.setDefaultBufferSize(resolution.width, resolution.height)
            val surface = Surface(texture)
            request.provideSurface(surface, executor, { })
        }
        val preview = Preview.Builder()
                .build().apply { setSurfaceProvider(surfaceProvider) }
        // Analysis
        val analyzer = ImageAnalysis.Analyzer { imageProxy -> // YUV_420_888 format
            val mediaImage = imageProxy.image ?: return@Analyzer
            val inputImage = InputImage.fromMediaImage(mediaImage, imageProxy.imageInfo.rotationDegrees)
            val scanner = BarcodeScanning.getClient()
            scanner.process(inputImage)
                    .addOnSuccessListener { barcodes ->
                        for (barcode in barcodes) {
                            val item = mapOf("name" to "barcode", "data" to barcode.data)
                            events?.success(item)
                        }
                    }
                    .addOnFailureListener { e -> Log.e(TAG, e.message, e) }
                    .addOnCompleteListener { imageProxy.close() }
        }
        val analysis = ImageAnalysis.Builder()
                .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                .build().apply { setAnalyzer(executor, analyzer) }
        // Start camera
        val lifecycleOwner = activity as LifecycleOwner
        camera = cameraProvider!!.bindToLifecycle(lifecycleOwner, selector, preview, analysis)
        camera!!.cameraInfo.torchState.observe(lifecycleOwner, { state ->
            // TorchState.OFF = 0; TorchState.ON = 1
            val item = mapOf("name" to "torchState", "data" to state)
            events?.success(item)
        })
        // TODO: seems there's not a better way to get the final resolution
        @SuppressLint("RestrictedApi")
        val resolution = preview.attachedSurfaceResolution!!
        val portrait = camera!!.cameraInfo.sensorRotationDegrees % 180 == 0
        val width = resolution.width.toDouble()
        val height = resolution.height.toDouble()
        size = if (portrait) mapOf("width" to width, "height" to height) else mapOf("width" to height, "height" to width)
    }

    private fun closeCamera() {
        cameraProvider!!.unbindAll()
        textureEntry!!.release()

        size = null
        camera = null
        textureId = null
        textureEntry = null
        cameraProvider = null
    }
}
