package dev.yanshouwang.camerax

import android.Manifest
import android.app.Activity
import android.content.pm.PackageManager
import android.graphics.ImageFormat
import android.graphics.Rect
import android.os.Build
import android.util.Log
import android.util.Size
import android.view.Surface
import androidx.annotation.NonNull
import androidx.camera.core.*
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.lifecycle.LifecycleOwner
import com.google.protobuf.ByteString
import dev.yanshouwang.camerax.messages.*
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import io.flutter.view.TextureRegistry
import java.nio.ByteBuffer
import java.util.concurrent.Executors
import java.util.concurrent.TimeUnit
import java.util.concurrent.TimeoutException

/** CameraXPlugin */
class CameraXPlugin : FlutterPlugin, ActivityAware {
    companion object {
        private const val NAMESPACE = "yanshouwang.dev/camerax"
        private const val REQUEST_CODE = 3543
    }

    private val methodExecutor by lazy { Executors.newSingleThreadExecutor() }

    private lateinit var textureRegistry: TextureRegistry
    private lateinit var binding: ActivityPluginBinding

    private var eventSink: EventChannel.EventSink? = null

    private val methodCallHandler by lazy {
        MethodChannel.MethodCallHandler { call, result ->
            val command = call.command
            when (command.category!!) {
                Messages.CommandCategory.COMMAND_CATEGORY_GET_QUARTER_TURNS -> {
                    val reply = reply {
                        this.getQuarterTurnsArguments = getQuarterTurnsReplyArguments {
                            this.quarterTurns = quarterTurnsObserver.quarterTurns
                        }
                    }.toByteArray()
                    result.success(reply)
                }
                Messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_REQUEST_PERMISSION -> {
                    val activity = binding.activity
                    val permissions = arrayOf(Manifest.permission.CAMERA)
                    val permissionsGranted = permissions.all { permission ->
                        ContextCompat.checkSelfPermission(
                            activity, permission
                        ) == PackageManager.PERMISSION_GRANTED
                    }

                    fun runnable(granted: Boolean) {
                        val reply = reply {
                            this.cameraControllerRequestPermissionArguments =
                                cameraControllerRequestPermissionReplyArguments {
                                    this.granted = granted
                                }
                        }.toByteArray()
                        result.success(reply)
                    }
                    if (permissionsGranted) {
                        runnable(permissionsGranted)
                    } else {
                        requestPermissionResultListeners.add { granted -> runnable(granted) }
                        ActivityCompat.requestPermissions(activity, permissions, REQUEST_CODE)
                    }
                }
                Messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_BIND -> {
                    val arguments = command.cameraControllerBindArguments
                    val selector = arguments.selector
                    val activity = binding.activity
                    val listenable = ProcessCameraProvider.getInstance(activity)
                    val mainExecutor = ContextCompat.getMainExecutor(activity)
                    listenable.addListener({
                        try {
                            val provider = listenable.get()
                            val lifecycleOwner = activity as LifecycleOwner
                            val textureEntry = textureRegistry.createSurfaceTexture()
                            val preview = Preview.Builder()
                                .setTargetRotation(Surface.ROTATION_0)
                                .build()
                            val imageAnalysis = ImageAnalysis.Builder()
                                .setTargetRotation(Surface.ROTATION_0)
                                .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                                .build()
                            val imageCapture = ImageCapture.Builder()
                                .setTargetRotation(Surface.ROTATION_0)
//                                .setTargetAspectRatio(AspectRatio.RATIO_16_9)
                                .setTargetResolution(Size(1080, 1920))
                                .build()
                            val camera = provider.bindToLifecycle(
                                lifecycleOwner,
                                selector.cameraxSelector,
                                preview,
                                imageAnalysis,
                                imageCapture,
                            )
                            val controller =
                                CameraController(
                                    camera,
                                    textureEntry,
                                    preview,
                                    imageAnalysis,
                                    imageCapture
                                )
                            preview.setSurfaceProvider { request ->
                                val texture = textureEntry.surfaceTexture()
                                val resolution = request.resolution
                                texture.setDefaultBufferSize(
                                    resolution.width, resolution.height
                                )
                                val surface = Surface(texture)
                                request.provideSurface(surface, mainExecutor) { }
                                controllers[selector] = controller
                                val reply = reply {
                                    this.cameraControllerBindArguments =
                                        cameraControllerBindReplyArguments {
                                            this.cameraValue = cameraValue {
                                                this.textureId = textureEntry.id().toInt()
                                                val cameraInfo = camera.cameraInfo
                                                if (cameraInfo.sensorRotationDegrees % 180 == 0) {
                                                    this.textureWidth = resolution.width
                                                    this.textureHeight = resolution.height
                                                } else {
                                                    this.textureWidth = resolution.height
                                                    this.textureHeight = resolution.width
                                                }
                                                this.torchAvailable = cameraInfo.hasFlashUnit()
                                                val zoomState = cameraInfo.zoomState.value!!
                                                this.zoomMinimum = zoomState.minZoomRatio.toDouble()
                                                this.zoomMaximum = zoomState.maxZoomRatio.toDouble()
                                            }
                                        }
                                }.toByteArray()
                                result.success(reply)
                            }
                            val imageAnalysisExecutor = Executors.newSingleThreadExecutor()
                            imageAnalysis.setAnalyzer(imageAnalysisExecutor) { imageProxy ->
                                if (imageProxy.format != ImageFormat.YUV_420_888) {
                                    val errorMessage =
                                        "The image proxy's format is unsupported: ${imageProxy.format}"
                                    eventSink?.error(TAG, errorMessage)
                                }
                                val imageProxyId = imageProxy.hashCode().toString()
                                val imageProxies = controller.imageProxies
                                imageProxies[imageProxyId] = imageProxy
                                val event = event {
                                    this.category =
                                        Messages.EventCategory.EVENT_CATEGORY_CAMERA_CONTROLLER_IMAGE_PROXIED
                                    this.cameraControllerImageProxiedArguments =
                                        cameraControllerImageProxiedEventArguments {
                                            this.imageProxy = imageProxy {
                                                this.selector = selector
                                                this.id = imageProxyId
                                                val imageBytes: ByteArray
                                                val imageWidth: Int
                                                val imageHeight: Int
                                                // 计算需要旋转的角度
                                                var rotationDegrees =
                                                    (imageProxy.imageInfo.rotationDegrees - activity.rotationDegrees) % 360
                                                if (rotationDegrees < 0) {
                                                    rotationDegrees += 360
                                                }
                                                when (rotationDegrees) {
                                                    0 -> {
                                                        imageBytes = imageProxy.bytes
                                                        imageWidth = imageProxy.width
                                                        imageHeight = imageProxy.height
                                                    }
                                                    90 -> {
                                                        imageBytes = rotate90(
                                                            imageProxy.bytes,
                                                            imageProxy.width,
                                                            imageProxy.height
                                                        )
                                                        imageWidth = imageProxy.height
                                                        imageHeight = imageProxy.width
                                                    }
                                                    180 -> {
                                                        imageBytes = rotate180(
                                                            imageProxy.bytes,
                                                            imageProxy.width,
                                                            imageProxy.height
                                                        )
                                                        imageWidth = imageProxy.width
                                                        imageHeight = imageProxy.height
                                                    }
                                                    270 -> {
                                                        imageBytes = rotate270(
                                                            imageProxy.bytes,
                                                            imageProxy.width,
                                                            imageProxy.height
                                                        )
                                                        imageWidth = imageProxy.height
                                                        imageHeight = imageProxy.width
                                                    }
                                                    else -> {
                                                        throw NotImplementedError()
                                                    }
                                                }
                                                this.data = ByteString.copyFrom(imageBytes)
                                                this.width = imageWidth
                                                this.height = imageHeight
                                            }
                                        }
                                }.toByteArray()
                                invokeOnMainThread { eventSink?.success(event) }
                            }
                        } catch (e: Exception) {
                            result.error(e)
                        }
                    }, mainExecutor)
                }
                Messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_UNBIND -> {
                    val arguments = command.cameraControllerUnbindArguments
                    val selector = arguments.selector
                    val activity = binding.activity
                    val listenable = ProcessCameraProvider.getInstance(activity)
                    val mainExecutor = ContextCompat.getMainExecutor(activity)
                    listenable.addListener({
                        try {
                            val provider = listenable.get()
                            val controller = controllers.remove(selector)!!
                            val preview = controller.preview
                            val imageAnalysis = controller.imageAnalysis
                            val imageCapture = controller.imageCapture
                            provider.unbind(preview, imageAnalysis, imageCapture)
                            val textureEntry = controller.textureEntry
                            textureEntry.release()
                            result.success()
                        } catch (e: Exception) {
                            result.error(e)
                        }
                    }, mainExecutor)
                }
                Messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_TORCH -> {
                    val arguments = command.cameraControllerTorchArguments
                    val selector = arguments.selector
                    val state = arguments.state
                    val controller = controllers[selector]!!
                    val camera = controller.camera
                    val listenable = camera.cameraControl.enableTorch(state)
                    val activity = binding.activity
                    val mainExecutor = ContextCompat.getMainExecutor(activity)
                    listenable.addListener({
                        try {
                            listenable.get()
                            result.success()
                        } catch (e: Exception) {
                            result.error(e)
                        }
                    }, mainExecutor)
                }
                Messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_ZOOM -> {
                    val arguments = command.cameraControllerZoomArguments
                    val selector = arguments.selector
                    val ratio = arguments.value.toFloat()
                    val controller = controllers[selector]!!
                    val camera = controller.camera
                    val listenable = camera.cameraControl.setZoomRatio(ratio)
                    val activity = binding.activity
                    val mainExecutor = ContextCompat.getMainExecutor(activity)
                    listenable.addListener({
                        try {
                            listenable.get()
                            result.success()
                        } catch (e: Exception) {
                            result.error(e)
                        }
                    }, mainExecutor)
                }
                Messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_LINEAR_ZOOM -> {
                    val arguments = command.cameraControllerLinearZoomArguments
                    val selector = arguments.selector
                    val linearZoom = arguments.value.toFloat()
                    val controller = controllers[selector]!!
                    val camera = controller.camera
                    val listenable = camera.cameraControl.setLinearZoom(linearZoom)
                    val activity = binding.activity
                    val mainExecutor = ContextCompat.getMainExecutor(activity)
                    listenable.addListener({
                        try {
                            listenable.get()
                            result.success()
                        } catch (e: Exception) {
                            result.error(e)
                        }
                    }, mainExecutor)
                }
                Messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_FOCUS_AUTOMATICALLY -> {
                    val arguments = command.cameraControllerFocusAutomaticallyArguments
                    val selector = arguments.selector
                    val controller = controllers[selector]!!
                    val camera = controller.camera
                    val listenable = camera.cameraControl.cancelFocusAndMetering()
                    val activity = binding.activity
                    val mainExecutor = ContextCompat.getMainExecutor(activity)
                    listenable.addListener({
                        try {
                            listenable.get()
                            result.success()
                        } catch (e: Exception) {
                            result.error(e)
                        }
                    }, mainExecutor)
                }
                Messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_FOCUS_MANUALLY -> {
                    val arguments = command.cameraControllerFocusManuallyArguments
                    val selector = arguments.selector
                    val width = arguments.width.toFloat()
                    val height = arguments.height.toFloat()
                    val x = arguments.x.toFloat()
                    val y = arguments.y.toFloat()
                    val controller = controllers[selector]!!
                    val camera = controller.camera
                    val cameraInfo = camera.cameraInfo
                    val activity = binding.activity
                    // 转到相机方向需要的角度（逆时针）
                    var rotationDegrees =
                        (cameraInfo.sensorRotationDegrees - activity.rotationDegrees) % 360
                    if (rotationDegrees < 0) {
                        rotationDegrees += 360
                    }
                    val point = when (rotationDegrees) {
                        0 -> {
                            SurfaceOrientedMeteringPointFactory(width, height).createPoint(x, y)
                        }
                        90 -> {
                            SurfaceOrientedMeteringPointFactory(height, width).createPoint(
                                y, width - x
                            )
                        }
                        180 -> {
                            SurfaceOrientedMeteringPointFactory(
                                width, height
                            ).createPoint(width - x, height - y)
                        }
                        270 -> {
                            SurfaceOrientedMeteringPointFactory(
                                height, width
                            ).createPoint(height - y, x)
                        }
                        else -> {
                            throw NotImplementedError()
                        }
                    }
                    val action = FocusMeteringAction.Builder(point).disableAutoCancel().build()
                    val listenable = camera.cameraControl.startFocusAndMetering(action)
                    // TODO: 目前 CameraX 在某些手机上不触发回调，等待官方解决
                    methodExecutor.execute {
                        try {
                            val fmr = listenable.get(5000, TimeUnit.MILLISECONDS)
                            if (!fmr.isFocusSuccessful) {
                                throw IllegalStateException("focusManually failed with $arguments.")
                            }
                            invokeOnMainThread { result.success() }
                        } catch (e: TimeoutException) {
                            Log.d(TAG, e.localizedMessage ?: "focusManually failed with $e.")
                            invokeOnMainThread { result.success() }
                        } catch (e: Exception) {
                            invokeOnMainThread { result.error(e) }
                        }
                    }
//                    val mainExecutor = ContextCompat.getMainExecutor(activity)
//                    listenable.addListener({
//                        try {
//                            listenable.get()
//                            result.success()
//                        } catch (e: Exception) {
//                            result.error(e)
//                        }
//                    }, mainExecutor)
                }
                Messages.CommandCategory.COMMAND_CATEGORY_CAMERA_CONTROLLER_CAPTURE_TO_MEMORY -> {
                    val arguments = command.cameraControllerCaptureToMemoryArguments
                    val selector = arguments.selector
                    val controller = controllers[selector]!!
                    val imageCapture = controller.imageCapture
                    val activity = binding.activity
                    val mainExecutor = ContextCompat.getMainExecutor(activity)
                    imageCapture.takePicture(
                        mainExecutor,
                        object : ImageCapture.OnImageCapturedCallback() {
                            override fun onCaptureSuccess(imageProxy: ImageProxy) {
                                super.onCaptureSuccess(imageProxy)
                                val imageProxyId = imageProxy.hashCode().toString()
                                val imageProxies = controller.imageProxies
                                imageProxies[imageProxyId] = imageProxy
                                val reply = reply {
                                    this.cameraControllerCaptureToMemoryArguments =
                                        cameraControllerCaptureToMemoryReplyArguments {
                                            this.imageProxy = imageProxy {
                                                this.selector = selector
                                                this.id = imageProxyId
                                                // JPG format
                                                val buffer = imageProxy.planes[0].buffer
                                                val bufferSize = buffer.remaining()
                                                val bytes = ByteArray(bufferSize)
                                                buffer.get(bytes)
                                                this.data = ByteString.copyFrom(bytes)
                                                this.width = imageProxy.width
                                                this.height = imageProxy.height
                                                this.rotationDegrees =
                                                    imageProxy.imageInfo.rotationDegrees
                                            }
                                        }
                                }.toByteArray()
                                result.success(reply)
                            }

                            override fun onError(e: ImageCaptureException) {
                                super.onError(e)
                                result.error(e)
                            }
                        })
                }
                Messages.CommandCategory.COMMAND_CATEGORY_IMAGE_PROXY_CLOSE -> {
                    val arguments = command.imageProxyCloseArguments
                    val selector = arguments.selector
                    val id = arguments.id
                    val controller = controllers[selector]
                    // 相机关闭后会释放 ImageProxy 实例
                    if (controller != null) {
                        val imageProxies = controller.imageProxies
                        val imageProxy = imageProxies.remove(id)!!
                        imageProxy.close()
                    }
                    result.success()
                }
                Messages.CommandCategory.UNRECOGNIZED -> result.notImplemented()
            }
        }
    }
    private val streamHandler by lazy {
        object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
            }
        }
    }

    private val requestPermissionResultListeners by lazy { mutableListOf<(granted: Boolean) -> Unit>() }
    private val requestPermissionResultListener by lazy {
        PluginRegistry.RequestPermissionsResultListener { requestCode, _, grantResults ->
            return@RequestPermissionsResultListener if (requestCode != REQUEST_CODE) false
            else {
                val granted = grantResults.all { result ->
                    result == PackageManager.PERMISSION_GRANTED
                }
                for (listener in requestPermissionResultListeners) {
                    listener(granted)
                }
                requestPermissionResultListeners.clear()
                true
            }
        }
    }

    private val quarterTurnsObserver by lazy {
        QuarterTurnsObserver { quarterTurns ->
            val event = event {
                this.quarterTurnsChangedArguments = quarterTurnsChangedEventArguments {
                    this.quarterTurns = quarterTurns
                }
            }.toByteArray()
            invokeOnMainThread { eventSink?.success(event) }
        }
    }

    private val controllers by lazy { mutableMapOf<Messages.CameraSelector, CameraController>() }

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        textureRegistry = binding.textureRegistry
        val messenger = binding.binaryMessenger
        MethodChannel(messenger, "$NAMESPACE/method").setMethodCallHandler(methodCallHandler)
        EventChannel(messenger, "$NAMESPACE/event").setStreamHandler(streamHandler)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {}

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.binding = binding
        binding.addRequestPermissionsResultListener(requestPermissionResultListener)
        quarterTurnsObserver.observe(binding.activity)
    }

    override fun onDetachedFromActivity() {
        val activity = binding.activity
        val listenable = ProcessCameraProvider.getInstance(activity)
        val mainExecutor = ContextCompat.getMainExecutor(activity)
        listenable.addListener({
            try {
                val provider = listenable.get()
                provider.unbindAll()
                for (controller in controllers.values) {
                    val textureEntry = controller.textureEntry
                    textureEntry.release()
                }
                controllers.clear()
            } catch (e: Exception) {
                Log.e(TAG, "Clear failed: ${e.message}", e)
            }
        }, mainExecutor)
        quarterTurnsObserver.cancel()
        binding.removeRequestPermissionsResultListener(requestPermissionResultListener)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    private fun invokeOnMainThread(action: Runnable) {
        binding.activity.runOnUiThread(action)
    }
}

val Any.TAG: String
    get() = this::class.java.simpleName

val MethodCall.command: Messages.Command
    get() {
        val data = arguments<ByteArray>()
        return Messages.Command.parseFrom(data)
    }

fun MethodChannel.Result.success() = success(null)

fun MethodChannel.Result.error(errorCode: String, errorMessage: String) {
    error(errorCode, errorMessage, null)
}

fun MethodChannel.Result.error(e: Exception) {
    val errorCode = e.TAG
    val errorMessage = e.localizedMessage
    val errorDetails = e.stackTraceToString()
    error(errorCode, errorMessage, errorDetails)
}

fun EventChannel.EventSink.error(errorCode: String, errorMessage: String) {
    error(errorCode, errorMessage, null)
}

@Suppress("DEPRECATION")
val Activity.rotation: Int
    get() = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) display!!.rotation
    else windowManager.defaultDisplay.rotation

val Activity.rotationDegrees: Int
    get() {
        return when (rotation) {
            Surface.ROTATION_0 -> 0
            Surface.ROTATION_90 -> 90
            Surface.ROTATION_180 -> 180
            Surface.ROTATION_270 -> 270
            else -> throw IllegalArgumentException()
        }
    }

val Messages.CameraSelector.cameraxSelector: CameraSelector
    get() {
        return when (facing!!) {
            Messages.CameraFacing.CAMERA_FACING_BACK -> CameraSelector.DEFAULT_BACK_CAMERA
            Messages.CameraFacing.CAMERA_FACING_FRONT -> CameraSelector.DEFAULT_FRONT_CAMERA
            Messages.CameraFacing.UNRECOGNIZED -> throw NotImplementedError()
        }
    }

val ImageProxy.bytes: ByteArray
    get() {
        // CameraX 升级到 beta2 版本后 cropRect 默认为（0，0，0，0）
        val rect = Rect(0, 0, width, height)
        this.setCropRect(rect)
        val cropWidth = cropRect.width()
        val cropHeight = cropRect.height()
        val pixelSize = cropWidth * cropHeight
        val bitsPerPixel = ImageFormat.getBitsPerPixel(ImageFormat.YUV_420_888)
        val byteBuffer = ByteBuffer.allocateDirect(pixelSize * bitsPerPixel / 8)
        byteBuffer.rewind()
        val bytes = byteBuffer.array()
        planes.forEachIndexed { index, plane ->
            val width: Int
            val height: Int
            // How many values are read in input for each output value written
            // Only the Y plane has a value for every pixel, U and V have half the resolution i.e.
            //
            // Y Plane            U Plane    V Plane
            // ===============    =======    =======
            // Y Y Y Y Y Y Y Y    U U U U    V V V V
            // Y Y Y Y Y Y Y Y    U U U U    V V V V
            // Y Y Y Y Y Y Y Y    U U U U    V V V V
            // Y Y Y Y Y Y Y Y    U U U U    V V V V
            // Y Y Y Y Y Y Y Y
            // Y Y Y Y Y Y Y Y
            // Y Y Y Y Y Y Y Y
            val stride: Int
            // The index in the output buffer the next value will be written at
            // For Y it's zero, for U and V we start at the end of Y and interleave them i.e.
            //
            // First chunk        Second chunk
            // ===============    ===============
            // Y Y Y Y Y Y Y Y    V U V U V U V U
            // Y Y Y Y Y Y Y Y    V U V U V U V U
            // Y Y Y Y Y Y Y Y    V U V U V U V U
            // Y Y Y Y Y Y Y Y    V U V U V U V U
            // Y Y Y Y Y Y Y Y
            // Y Y Y Y Y Y Y Y
            // Y Y Y Y Y Y Y Y
            var offset: Int
            when (index) {
                0 -> {
                    width = cropWidth
                    height = cropHeight
                    stride = 1
                    offset = 0
                }
                1 -> {
                    width = cropWidth / 2
                    height = cropHeight / 2
                    stride = 2
                    // For NV21 format, U is in odd-numbered indices
                    offset = pixelSize + 1
                }
                2 -> {
                    width = cropWidth / 2
                    height = cropHeight / 2
                    stride = 2
                    // For NV21 format, V is in even-numbered indices
                    offset = pixelSize
                }
                else -> return@forEachIndexed
            }
            val buffer = plane.buffer
            val rowStride = plane.rowStride
            val pixelStride = plane.pixelStride
            // Intermediate buffer used to store the bytes of each row
            val rawBytes = ByteArray(plane.rowStride)
            // Size of each row in bytes
            val rowLength = if (pixelStride == 1 && stride == 1) width
            // Take into account that the stride may include data from pixels other than this
            // particular plane and row, and that could be between pixels and not after every
            // pixel:
            //
            // |---- Pixel stride ----|                    Row ends here --> |
            // | Pixel 1 | Other Data | Pixel 2 | Other Data | ... | Pixel N |
            //
            // We need to get (N-1) * (pixel stride bytes) per row + 1 byte for the last pixel
            else (width - 1) * pixelStride + 1
            for (row in 0 until height) {
                // Move buffer position to the beginning of this row
                val newPosition = (row + cropRect.top) * rowStride + cropRect.left * pixelStride
                buffer.position(newPosition)
                if (pixelStride == 1 && stride == 1) {
                    // When there is a single stride value for pixel and output, we can just copy
                    // the entire row in a single step
                    buffer.get(bytes, offset, rowLength)
                    offset += rowLength
                } else {
                    // When either pixel or output have a stride > 1 we must copy pixel by pixel
                    buffer.get(rawBytes, 0, rowLength)
                    for (column in 0 until width) {
                        bytes[offset] = rawBytes[column * pixelStride]
                        offset += stride
                    }
                }
            }
        }
        return bytes
    }

fun rotate90(nv21: ByteArray, width: Int, height: Int): ByteArray {
    val yuv = ByteArray(width * height * 3 / 2)
    // 旋转 Y 亮度分量
    var i = 0
    for (x in 0 until width) {
        for (y in height - 1 downTo 0) {
            yuv[i] = nv21[y * width + x]
            i++
        }
    }
    // 旋转 U, V 色度分量
    i = width * height * 3 / 2 - 1
    var x = width - 1
    while (x > 0) {
        for (y in 0 until height / 2) {
            yuv[i] = nv21[width * height + y * width + x]
            i--
            yuv[i] = nv21[width * height + y * width + (x - 1)]
            i--
        }
        x -= 2
    }
    return yuv
}

fun rotate180(nv21: ByteArray, width: Int, height: Int): ByteArray {
    val yuv = ByteArray(width * height * 3 / 2)
    // 旋转 Y 亮度分量
    var count = 0
    var i = width * height - 1
    while (i >= 0) {
        yuv[count] = nv21[i]
        count++
        i--
    }
    // 旋转 U, V 色度分量
    i = width * height * 3 / 2 - 1
    while (i >= width * height) {
        yuv[count++] = nv21[i - 1]
        yuv[count++] = nv21[i]
        i -= 2
    }
    return yuv
}

fun rotate270(nv21: ByteArray, width: Int, height: Int): ByteArray {
    val yuv = ByteArray(width * height * 3 / 2)
    // 旋转 Y 亮度分量
    var i = 0
    for (x in width - 1 downTo 0) {
        for (y in 0 until width) {
            yuv[i] = nv21[y * width + x]
            i++
        }
    }
    // 旋转 U, V 色度分量
    i = width * height
    var x = width - 1
    while (x > 0) {
        for (y in 0 until height / 2) {
            yuv[i] = nv21[width * height + y * width + (x - 1)]
            i++
            yuv[i] = nv21[width * height + y * width + x]
            i++
        }
        x -= 2
    }
    return yuv
}