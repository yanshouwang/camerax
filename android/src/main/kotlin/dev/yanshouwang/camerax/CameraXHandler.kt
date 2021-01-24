package dev.yanshouwang.camerax

import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.content.pm.PackageManager
import android.view.Surface
import androidx.annotation.NonNull
import androidx.camera.core.CameraControl
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.Preview
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.util.Consumer
import androidx.lifecycle.LifecycleOwner
import io.flutter.plugin.common.*
import io.flutter.view.TextureRegistry

class CameraXHandler(private val activity: Activity, binaryMessenger: BinaryMessenger, private val textureRegistry: TextureRegistry) : MethodChannel.MethodCallHandler, EventChannel.StreamHandler {
    companion object {
        const val CAMERA_REQUEST_CODE = 1993
        val PERMISSIONS_REQUIRED = arrayOf(Manifest.permission.CAMERA)
    }

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private val method = MethodChannel(binaryMessenger, "yanshouwang.dev/camerax/method")
    private val event = EventChannel(binaryMessenger, "yanshouwang.dev/camerax/event")
    private var listener: PluginRegistry.RequestPermissionsResultListener? = null
    private var cameraProvider: ProcessCameraProvider? = null
    private var camera: CameraControl? = null
    private var textureEntry: TextureRegistry.SurfaceTextureEntry? = null
    private var streamSink: EventChannel.EventSink? = null

    init {
        method.setMethodCallHandler(this)
        event.setStreamHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "init" -> init(call, result)
            "dispose" -> dispose()
            else -> result.notImplemented()
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        streamSink = events
    }

    override fun onCancel(arguments: Any?) {
        streamSink = null
    }

    fun stopListening() {
        method.setMethodCallHandler(null)
        event.setStreamHandler(null)
    }

    private fun init(call: MethodCall, result: MethodChannel.Result) {
        if (ContextCompat.checkSelfPermission(activity, Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED) {
            startCamera(call, result)
        } else {
            if (listener != null) {
                result.error("init", "duplicate call", null)
            } else {
                listener = PluginRegistry.RequestPermissionsResultListener { requestCode, _, grantResults ->
                    if (requestCode == CAMERA_REQUEST_CODE && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                        startCamera(call, result)
                        listener = null
                    }
                    true
                }
                ActivityCompat.requestPermissions(activity, PERMISSIONS_REQUIRED, CAMERA_REQUEST_CODE)
            }
        }
    }

    private fun startCamera(call: MethodCall, result: MethodChannel.Result) {
        textureEntry = textureRegistry.createSurfaceTexture()
        val future = ProcessCameraProvider.getInstance(activity)
        val executor = ContextCompat.getMainExecutor(activity)
        future.addListener(Runnable {
            cameraProvider = future.get()
            val lifecycleOwner = activity as LifecycleOwner
            val selector = when (call.arguments) {
                "front" -> CameraSelector.DEFAULT_FRONT_CAMERA
                else -> CameraSelector.DEFAULT_BACK_CAMERA
            }
            // Preview
            val surfaceProvider = Preview.SurfaceProvider { request ->
                val resolution = request.resolution
                val texture = textureEntry!!.surfaceTexture()
                texture.setDefaultBufferSize(resolution.width, resolution.height)
                val surface = Surface(texture)
                request.provideSurface(surface, executor, Consumer { })
            }
            val preview = Preview.Builder().build().apply { setSurfaceProvider(surfaceProvider) }
            // Analysis
            val analyzer = ImageAnalysis.Analyzer { image -> // YUV_420_888 format
                val planes = image.planes.map { plane ->
                    val buffer = plane.buffer
                    val bytes = ByteArray(buffer.remaining())
                    plane.buffer.get(bytes)
                    mapOf("bytes" to bytes, "rowStride" to plane.rowStride, "pixelStride" to plane.pixelStride)
                }
                val data = mapOf("planes" to planes, "format" to image.format, "width" to image.width, "height" to image.height, "rotation" to image.imageInfo.rotationDegrees)
                streamSink?.success(data)
                image.close()
            }
            val analysis = ImageAnalysis.Builder().build().apply { setAnalyzer(executor, analyzer) }
            // Start camera
            val camera = cameraProvider!!.bindToLifecycle(lifecycleOwner, selector, preview, analysis)
            this.camera = camera.cameraControl
            // TODO: seems there's not a better way to get the final resolution
            @SuppressLint("RestrictedApi")
            val resolution = preview.attachedSurfaceResolution!!
            val natural = camera.cameraInfo.sensorRotationDegrees % 90 == 0
            val width = if (natural) resolution.width else resolution.height
            val height = if (natural) resolution.height else resolution.width
            val answer = mapOf("textureId" to textureEntry!!.id(), "width" to width, "height" to height)
            result.success(answer)
        }, executor)
    }

    private fun dispose() {
        cameraProvider!!.unbindAll()
        cameraProvider = null
        camera = null
        textureEntry!!.release()
        textureEntry = null
        streamSink = null
    }
}