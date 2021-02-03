package dev.yanshouwang.camerax

import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.content.pm.PackageManager
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.util.Size
import android.view.Surface
import androidx.annotation.NonNull
import androidx.camera.core.*
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.util.Consumer
import androidx.lifecycle.LifecycleOwner
import com.google.gson.Gson
import com.google.mlkit.vision.barcode.Barcode
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

    private var sink: EventChannel.EventSink? = null
    private var instanceId: Int? = null
    private var listener: PluginRegistry.RequestPermissionsResultListener? = null
    private var cameraProvider: ProcessCameraProvider? = null
    private var camera: CameraControl? = null
    private var textureEntry: TextureRegistry.SurfaceTextureEntry? = null
    private var textureId: Long? = null
    private var resolution: Size? = null

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "state" -> stateNative(result)
            "request" -> requestNative(result)
            "init" -> initNative(call, result)
            "dispose" -> disposeNative(call, result)
            else -> result.notImplemented()
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        sink = events
    }

    override fun onCancel(arguments: Any?) {
        sink = null
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
        if (instanceId != null) {
            closeCamera()
            instanceId = null
        }
        val arguments = call.arguments as List<*>
        val id = arguments[0] as Int
        val selector =
                if (arguments[1] == 0) CameraSelector.DEFAULT_FRONT_CAMERA
                else CameraSelector.DEFAULT_BACK_CAMERA
        val future = ProcessCameraProvider.getInstance(activity)
        val executor = ContextCompat.getMainExecutor(activity)
        future.addListener(Runnable {
            cameraProvider = future.get()
            startCamera(selector)
            instanceId = id
            val width = resolution!!.width.toDouble()
            val height = resolution!!.height.toDouble()
            val answer = mapOf("textureId" to textureId, "width" to width, "height" to height)
            result.success(answer)
        }, executor)
    }

    private fun disposeNative(call: MethodCall, result: MethodChannel.Result) {
        val id = call.arguments as Int
        if (id == instanceId) {
            closeCamera()
            instanceId = null
        }
        result.success(null)
    }

    private fun startCamera(selector: CameraSelector) {
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
                            sink?.success(barcode.data)
                        }
                    }
                    .addOnFailureListener { e -> Log.e(TAG, e.message, e) }
                    .addOnCompleteListener { imageProxy.close() }
        }
        val analysis = ImageAnalysis.Builder()
                //.setTargetResolution(Size(1920, 1080))  // 1080P
                .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                .build().apply { setAnalyzer(executor, analyzer) }
        // Start camera
        val lifecycleOwner = activity as LifecycleOwner
        val camera = cameraProvider!!.bindToLifecycle(lifecycleOwner, selector, preview, analysis)
        this.camera = camera.cameraControl
        // TODO: seems there's not a better way to get the final resolution
        @SuppressLint("RestrictedApi")
        val cameraSize = preview.attachedSurfaceResolution!!
        val natural = camera.cameraInfo.sensorRotationDegrees % 180 == 0
        val width = if (natural) cameraSize.width else cameraSize.height
        val height = if (natural) cameraSize.height else cameraSize.width
        resolution = Size(width, height)
    }

    private fun closeCamera() {
        resolution = null
        camera = null
        textureId = null
        textureEntry!!.release()
        cameraProvider!!.unbindAll()
        cameraProvider = null
    }
}
