package dev.yanshouwang.camerax

import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.content.pm.PackageManager
import android.graphics.*
import android.view.Surface
import androidx.annotation.NonNull
import androidx.camera.core.*
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.core.util.Consumer
import androidx.lifecycle.LifecycleOwner
import com.huawei.hms.hmsscankit.ScanUtil
import com.huawei.hms.ml.scan.HmsScan
import com.huawei.hms.ml.scan.HmsScanAnalyzerOptions
import io.flutter.plugin.common.*
import io.flutter.view.TextureRegistry
import java.io.ByteArrayOutputStream

class CameraXHandler(private val activity: Activity, binaryMessenger: BinaryMessenger, private val textureRegistry: TextureRegistry)
    : MethodChannel.MethodCallHandler, EventChannel.StreamHandler, PluginRegistry.RequestPermissionsResultListener {
    companion object {
        private const val CAMERA_REQUEST_CODE = 1993
        private val PERMISSIONS_REQUIRED = arrayOf(Manifest.permission.CAMERA)
    }

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private val method = MethodChannel(binaryMessenger, "yanshouwang.dev/camerax/method")
    private val event = EventChannel(binaryMessenger, "yanshouwang.dev/camerax/event")
    private var sink: EventChannel.EventSink? = null
    private var listener: PluginRegistry.RequestPermissionsResultListener? = null
    private var cameraProvider: ProcessCameraProvider? = null
    private var camera: CameraControl? = null
    private var textureEntry: TextureRegistry.SurfaceTextureEntry? = null

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "state" -> stateNative(call, result)
            "request" -> requestNative(call, result)
            "init" -> initNative(call, result)
            "dispose" -> disposeNative()
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

    fun startListening() {
        method.setMethodCallHandler(this)
        event.setStreamHandler(this)
    }

    fun stopListening() {
        method.setMethodCallHandler(null)
        event.setStreamHandler(null)
    }

    private fun stateNative(call: MethodCall, result: MethodChannel.Result) {
        val state = when {
            // Authorized = 1
            ContextCompat.checkSelfPermission(activity, Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED -> 1
            // NotDetermined = 0
            ActivityCompat.shouldShowRequestPermissionRationale(activity, Manifest.permission.CAMERA) -> 0
            // Dined = 2
            else -> 2
        }

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
        textureEntry = textureRegistry.createSurfaceTexture()
        val future = ProcessCameraProvider.getInstance(activity)
        val executor = ContextCompat.getMainExecutor(activity)
        future.addListener(Runnable {
            cameraProvider = future.get()
            val lifecycleOwner = activity as LifecycleOwner
            val selector =
                    if (call.arguments == "front") CameraSelector.DEFAULT_FRONT_CAMERA
                    else CameraSelector.DEFAULT_BACK_CAMERA
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
                val bitmap = image.bitmap
                val options = HmsScanAnalyzerOptions.Creator().setHmsScanTypes(HmsScan.ALL_SCAN_TYPE).setPhotoMode(false).create()
                val scans = ScanUtil.decodeWithBitmap(activity, bitmap, options)
                for (scan in scans) {
                    val data = mapOf("type" to scan.scanType, "value" to scan.originalValue, "corners" to scan.corners)
                    sink?.success(data)
                }
                image.close()
            }
            val analysis = ImageAnalysis.Builder().build().apply { setAnalyzer(executor, analyzer) }
            // Start camera
            cameraProvider!!.unbindAll()
            val camera = cameraProvider!!.bindToLifecycle(lifecycleOwner, selector, preview, analysis)
            this.camera = camera.cameraControl
            // TODO: seems there's not a better way to get the final resolution
            @SuppressLint("RestrictedApi")
            val resolution = preview.attachedSurfaceResolution!!
            val natural = camera.cameraInfo.sensorRotationDegrees % 180 == 0
            val width = if (natural) resolution.width else resolution.height
            val height = if (natural) resolution.height else resolution.width
            val answer = mapOf("textureId" to textureEntry!!.id(), "width" to width.toDouble(), "height" to height.toDouble())
            result.success(answer)
        }, executor)
    }

    private fun disposeNative() {
        cameraProvider!!.unbindAll()
        cameraProvider = null
        camera = null
        textureEntry!!.release()
        textureEntry = null
        sink = null
    }
}

val ImageProxy.bitmap: Bitmap
    get() {
        val strides = arrayOf(y.rowStride, u.rowStride, v.rowStride).toIntArray()
        val stream = ByteArrayOutputStream()
        val rectangle = Rect(0, 0, width, height)
        // Only support ImageFormat.NV21 and ImageFormat.YUY2 for now
        YuvImage(nv21, ImageFormat.NV21, width, height, strides).compressToJpeg(rectangle, 100, stream)
        val data = stream.toByteArray()
        return BitmapFactory.decodeByteArray(data, 0, data.size)
    }

val ImageProxy.y: ImageProxy.PlaneProxy
    get() = planes[0]

val ImageProxy.u: ImageProxy.PlaneProxy
    get() = planes[1]

val ImageProxy.v: ImageProxy.PlaneProxy
    get() = planes[2]

val ImageProxy.nv21: ByteArray
    get() {
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
            if (BuildConfig.DEBUG) {
                if (u.buffer.remaining() != uvSize || v.buffer.remaining() != uvSize) {
                    error("Assertion failed")
                }
            }
            v.buffer.get(data, ySize, uvSize)
            if (BuildConfig.DEBUG) {
                val dst = ByteArray(uvSize)
                u.buffer.get(dst)
                if (data[uvSize] != dst[1]) {
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

val HmsScan.corners: List<Map<String, Int>>
    get() = cornerPoints.map { point -> mapOf("x" to point.x, "y" to point.y) }