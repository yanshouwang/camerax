package dev.yanshouwang.camerax

import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.content.pm.PackageManager
import android.graphics.ImageFormat
import android.os.Handler
import android.os.Looper
import android.util.Size
import android.view.Surface
import androidx.annotation.NonNull
import androidx.camera.core.*
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.util.Consumer
import androidx.lifecycle.LifecycleOwner
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import io.flutter.view.TextureRegistry
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors

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
    private var executor: ExecutorService? = null
    private var textureEntry: TextureRegistry.SurfaceTextureEntry? = null
    private var textureId: Long? = null
    private var resolution: Size? = null

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "state" -> stateNative(call, result)
            "request" -> requestNative(call, result)
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

    private fun stateNative(call: MethodCall, result: MethodChannel.Result) {
        // Can't get exact denied or not_determined state without request. Just return not_determined when state isn't authorized
        val state =
                if (ContextCompat.checkSelfPermission(activity, Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED) 1
                else 0
        result.success(state)
    }

    private fun requestNative(call: MethodCall, result: MethodChannel.Result) {
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
            request.provideSurface(surface, executor, Consumer { })
        }
        val preview = Preview.Builder().build().apply { setSurfaceProvider(surfaceProvider) }
        // Analysis
        val analyzer = ImageAnalysis.Analyzer { image -> // YUV_420_888 format
            val bytes = image.yuv
            val size = mapOf("width" to image.width.toDouble(), "height" to image.height.toDouble())
            val format = ImageFormat.YUV_420_888
            val rotation = image.imageInfo.rotationDegrees
            val metadata = image.planes.map { plane -> mapOf("rowStride" to plane.rowStride) }
            val data = mapOf("bytes" to bytes, "size" to size, "format" to format, "rotation" to rotation, "metadata" to metadata)
            val looper = Looper.getMainLooper()
            Handler(looper).post { sink?.success(data) }
            image.close()
        }
        val analysis = ImageAnalysis.Builder()
                //.setTargetResolution(Size(1920, 1080))  // 1080P
                .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                .build().apply {
                    this@CameraXHandler.executor = Executors.newSingleThreadExecutor()
                    setAnalyzer(this@CameraXHandler.executor!!, analyzer)
                }
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
        executor!!.shutdown()
        executor = null
        camera = null
        textureId = null
        textureEntry!!.release()
        cameraProvider!!.unbindAll()
        cameraProvider = null
    }
}

val ImageProxy.yuv: ByteArray
    get() {
        val ySize = y.buffer.remaining()
        val uSize = u.buffer.remaining()
        val vSize = v.buffer.remaining()

        val size = ySize + uSize + vSize
        val data = ByteArray(size)

        var offset = 0
        y.buffer.get(data, offset, ySize)
        offset += ySize
        u.buffer.get(data, offset, uSize)
        offset += uSize
        v.buffer.get(data, offset, vSize)

        return data
    }

val ImageProxy.nv21: ByteArray
    get() {
        val degrees = imageInfo.rotationDegrees

        if (BuildConfig.DEBUG) {
            if (y.pixelStride != 1 || u.rowStride != v.rowStride || u.pixelStride != v.pixelStride) {
                error("Assertion failed")
            }
        }

        val ySize = width * height
        val uvSize = ySize / 2
        val size = ySize + uvSize
        val data = ByteArray(size)

        var offset = 0
        // Y Plane
        if (y.rowStride == width) {
            y.buffer.get(data, offset, ySize)
            offset += ySize
        } else {
            for (row in 0 until height) {
                y.buffer.get(data, offset, width)
                offset += width
            }

            if (BuildConfig.DEBUG && offset != ySize) {
                error("Assertion failed")
            }
        }
        // U,V Planes
        if (v.rowStride == width && v.pixelStride == 2) {
            if (BuildConfig.DEBUG && v.size != uvSize - 1) {
                error("Assertion failed")
            }

            v.buffer.get(data, offset, 1)
            offset += 1
            u.buffer.get(data, offset, u.size)
            if (BuildConfig.DEBUG) {
                val value = v.buffer.get()
                if (data[offset] != value) {
                    error("Assertion failed")
                }
            }
        } else {
            for (row in 0 until height / 2)
                for (col in 0 until width / 2) {
                    val index = row * v.rowStride + col * v.pixelStride
                    data[offset++] = v.buffer.get(index)
                    data[offset++] = u.buffer.get(index)
                }

            if (BuildConfig.DEBUG && offset != size) {
                error("Assertion failed")
            }
        }

        return data
    }

val ImageProxy.PlaneProxy.size
    get() = buffer.remaining()

val ImageProxy.y: ImageProxy.PlaneProxy
    get() = planes[0]

val ImageProxy.u: ImageProxy.PlaneProxy
    get() = planes[1]

val ImageProxy.v: ImageProxy.PlaneProxy
    get() = planes[2]