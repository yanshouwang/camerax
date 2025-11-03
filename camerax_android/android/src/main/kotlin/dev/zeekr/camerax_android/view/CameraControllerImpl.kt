package dev.zeekr.camerax_android.view

import androidx.camera.core.CameraControl
import androidx.camera.core.CameraInfo
import androidx.camera.core.CameraSelector
import androidx.camera.core.DynamicRange
import androidx.camera.core.ExperimentalZeroShutterLag
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageCapture
import androidx.camera.core.ZoomState
import androidx.camera.core.resolutionselector.ResolutionSelector
import androidx.camera.video.FileOutputOptions
import androidx.camera.video.QualitySelector
import androidx.camera.video.Recording
import androidx.camera.view.CameraController
import androidx.camera.view.video.AudioConfig
import androidx.core.content.ContextCompat
import androidx.lifecycle.LifecycleOwner
import com.google.common.util.concurrent.FutureCallback
import com.google.common.util.concurrent.Futures
import dev.zeekr.camerax_android.CameraControllerUseCaseApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.ImageAnalysisOutputImageFormatApi
import dev.zeekr.camerax_android.ImageAnalysisStrategyApi
import dev.zeekr.camerax_android.ImageCaptureCaptureModeApi
import dev.zeekr.camerax_android.ImageCaptureFlashModeApi
import dev.zeekr.camerax_android.MirrorModeApi
import dev.zeekr.camerax_android.PigeonApiCameraControllerApi
import dev.zeekr.camerax_android.TorchStateApi
import dev.zeekr.camerax_android.activity
import dev.zeekr.camerax_android.common.IntRange
import dev.zeekr.camerax_android.common.TorchStateObserver
import dev.zeekr.camerax_android.common.VideoRecordEventConsumer
import dev.zeekr.camerax_android.common.ZoomStateObserver
import dev.zeekr.camerax_android.context
import dev.zeekr.camerax_android.core.flashModeApi
import dev.zeekr.camerax_android.core.imageAnalysisOutputImageFormatApi
import dev.zeekr.camerax_android.core.imageAnalysisStrategyApi
import dev.zeekr.camerax_android.core.imageCaptureCaptureModeApi
import dev.zeekr.camerax_android.core.impl
import dev.zeekr.camerax_android.core.mirrorModeApi
import dev.zeekr.camerax_android.core.torchStateApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.guava.await
import kotlinx.coroutines.launch

class CameraControllerImpl(private val registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCameraControllerApi(registrar) {
    override fun initialize(pigeon_instance: CameraController, callback: (Result<Unit>) -> Unit) {
        val future = pigeon_instance.initializationFuture
        val executor = ContextCompat.getMainExecutor(registrar.context)
        Futures.addCallback(future, object : FutureCallback<Void> {
            override fun onSuccess(result: Void?) {
                callback(Result.success(Unit))
            }

            override fun onFailure(t: Throwable) {
                callback(Result.failure(t))
            }
        }, executor)
    }

    override fun hasCamera(
        pigeon_instance: CameraController, cameraSelector: CameraSelector, callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.hasCamera(cameraSelector)
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getCameraSelector(pigeon_instance: CameraController, callback: (Result<CameraSelector>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.cameraSelector
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setCameraSelector(
        pigeon_instance: CameraController, cameraSelector: CameraSelector, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.cameraSelector = cameraSelector
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getCameraInfo(pigeon_instance: CameraController, callback: (Result<CameraInfo?>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.cameraInfo
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getCameraControl(pigeon_instance: CameraController, callback: (Result<CameraControl?>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.cameraControl
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getTorchState(pigeon_instance: CameraController, callback: (Result<TorchStateApi?>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                callback(Result.success(pigeon_instance.torchState.value?.torchStateApi))
            } catch (e: Throwable) {
                callback(Result.failure(e))
            }
        }
    }

    override fun observeTorchState(
        pigeon_instance: CameraController,
        observer: TorchStateObserver,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val owner = registrar.activity as LifecycleOwner
                pigeon_instance.torchState.observe(owner, observer)
                callback(Result.success(Unit))
            } catch (e: Throwable) {
                callback(Result.failure(e))
            }
        }
    }

    override fun removeTorchStateObserver(
        pigeon_instance: CameraController,
        observer: TorchStateObserver,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.torchState.removeObserver(observer)
                callback(Result.success(Unit))
            } catch (e: Throwable) {
                callback(Result.failure(e))
            }
        }
    }

    override fun enableTorch(
        pigeon_instance: CameraController, torchEnabled: Boolean, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.enableTorch(torchEnabled).await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getZoomState(pigeon_instance: CameraController, callback: (Result<ZoomState?>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                callback(Result.success(pigeon_instance.zoomState.value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun observeZoomState(
        pigeon_instance: CameraController,
        observer: ZoomStateObserver,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val owner = registrar.activity as LifecycleOwner
                pigeon_instance.zoomState.observe(owner, observer)
                callback(Result.success(Unit))
            } catch (e: Throwable) {
                callback(Result.failure(e))
            }
        }
    }

    override fun removeZoomStateObserver(
        pigeon_instance: CameraController,
        observer: ZoomStateObserver,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.zoomState.removeObserver(observer)
                callback(Result.success(Unit))
            } catch (e: Throwable) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setZoomRatio(pigeon_instance: CameraController, zoomRatio: Double, callback: (Result<Unit>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setZoomRatio(zoomRatio.toFloat()).await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setLinearZoom(
        pigeon_instance: CameraController, linearZoom: Double, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setLinearZoom(linearZoom.toFloat()).await()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isPinchToZoomEnabled(pigeon_instance: CameraController, callback: (Result<Boolean>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.isPinchToZoomEnabled
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setPinchToZoomEnabled(
        pigeon_instance: CameraController, enabled: Boolean, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.isPinchToZoomEnabled = enabled
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isTapToFocusEnabled(pigeon_instance: CameraController, callback: (Result<Boolean>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.isTapToFocusEnabled
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setTapToFocusEnabled(
        pigeon_instance: CameraController, enabled: Boolean, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.isTapToFocusEnabled = enabled
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isImageCaptureEnabled(pigeon_instance: CameraController, callback: (Result<Boolean>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.isImageCaptureEnabled
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isImageAnalysisEnabled(pigeon_instance: CameraController, callback: (Result<Boolean>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.isImageAnalysisEnabled
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isVideoCaptureEnabled(pigeon_instance: CameraController, callback: (Result<Boolean>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.isVideoCaptureEnabled
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setEnabledUseCases(
        pigeon_instance: CameraController,
        enabledUseCases: List<CameraControllerUseCaseApi>,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {

                pigeon_instance.setEnabledUseCases(
                    enabledUseCases.map { it.impl }.reduce { acc, unit -> acc or unit })
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getPreviewResolutionSelector(
        pigeon_instance: CameraController, callback: (Result<ResolutionSelector?>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.previewResolutionSelector
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setPreviewResolutionSelector(
        pigeon_instance: CameraController, resolutionSelector: ResolutionSelector?, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.previewResolutionSelector = resolutionSelector
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getImageCaptureResolutionSelector(
        pigeon_instance: CameraController, callback: (Result<ResolutionSelector?>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.imageCaptureResolutionSelector
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageCaptureResolutionSelector(
        pigeon_instance: CameraController, resolutionSelector: ResolutionSelector?, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageCaptureResolutionSelector = resolutionSelector
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getImageCaptureMode(
        pigeon_instance: CameraController,
        callback: (Result<ImageCaptureCaptureModeApi>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                callback(Result.success(pigeon_instance.imageCaptureMode.imageCaptureCaptureModeApi))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    @ExperimentalZeroShutterLag
    override fun setImageCaptureMode(
        pigeon_instance: CameraController,
        captureMode: ImageCaptureCaptureModeApi,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageCaptureMode = captureMode.impl
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getImageCaptureFlashMode(
        pigeon_instance: CameraController,
        callback: (Result<ImageCaptureFlashModeApi>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                callback(Result.success(pigeon_instance.imageCaptureFlashMode.flashModeApi))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageCaptureFlashMode(
        pigeon_instance: CameraController,
        flashMode: ImageCaptureFlashModeApi,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageCaptureFlashMode = flashMode.impl
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun takePicture(
        pigeon_instance: CameraController,
        capturedCallback: ImageCapture.OnImageCapturedCallback,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val executor = ContextCompat.getMainExecutor(registrar.context)
                pigeon_instance.takePicture(executor, capturedCallback)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getImageAnalysisResolutionSelector(
        pigeon_instance: CameraController, callback: (Result<ResolutionSelector?>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.imageAnalysisResolutionSelector
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageAnalysisResolutionSelector(
        pigeon_instance: CameraController, resolutionSelector: ResolutionSelector?, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageAnalysisResolutionSelector = resolutionSelector
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getImageAnalysisBackpressureStrategy(
        pigeon_instance: CameraController,
        callback: (Result<ImageAnalysisStrategyApi>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                callback(Result.success(pigeon_instance.imageAnalysisBackpressureStrategy.imageAnalysisStrategyApi))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageAnalysisBackpressureStrategy(
        pigeon_instance: CameraController,
        strategy: ImageAnalysisStrategyApi,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageAnalysisBackpressureStrategy = strategy.impl
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getImageAnalysisImageQueueDepth(pigeon_instance: CameraController, callback: (Result<Long>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.imageAnalysisImageQueueDepth.toLong()
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageAnalysisImageQueueDepth(
        pigeon_instance: CameraController, depth: Long, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageAnalysisImageQueueDepth = depth.toInt()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getImageAnalysisOutputImageFormat(
        pigeon_instance: CameraController,
        callback: (Result<ImageAnalysisOutputImageFormatApi>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                callback(Result.success(pigeon_instance.imageAnalysisOutputImageFormat.imageAnalysisOutputImageFormatApi))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageAnalysisOutputImageFormat(
        pigeon_instance: CameraController,
        imageAnalysisOutputImageFormat: ImageAnalysisOutputImageFormatApi,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageAnalysisOutputImageFormat = imageAnalysisOutputImageFormat.impl
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageAnalysisAnalyzer(
        pigeon_instance: CameraController, analyzer: ImageAnalysis.Analyzer, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val executor = ContextCompat.getMainExecutor(registrar.context)
                pigeon_instance.setImageAnalysisAnalyzer(executor, analyzer)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun clearImageAnalysisAnalyzer(pigeon_instance: CameraController, callback: (Result<Unit>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.clearImageAnalysisAnalyzer()
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getVideoCaptureDynamicRange(
        pigeon_instance: CameraController, callback: (Result<DynamicRange>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.videoCaptureDynamicRange
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setVideoCaptureDynamicRange(
        pigeon_instance: CameraController, dynamicRange: DynamicRange, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.videoCaptureDynamicRange = dynamicRange
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getVideoCaptureMirrorMode(
        pigeon_instance: CameraController, callback: (Result<MirrorModeApi>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.videoCaptureMirrorMode.mirrorModeApi
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setVideoCaptureMirrorMode(
        pigeon_instance: CameraController, mirrorMode: MirrorModeApi, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.videoCaptureMirrorMode = mirrorMode.impl
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getVideoCaptureQualitySelector(
        pigeon_instance: CameraController, callback: (Result<QualitySelector>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.videoCaptureQualitySelector
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setVideoCaptureQualitySelector(
        pigeon_instance: CameraController, qualitySelector: QualitySelector, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.videoCaptureQualitySelector = qualitySelector
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getVideoCaptureTargetFrameRate(
        pigeon_instance: CameraController, callback: (Result<IntRange>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = IntRange(pigeon_instance.videoCaptureTargetFrameRate)
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setVideoCaptureTargetFrameRate(
        pigeon_instance: CameraController, targetFrameRate: IntRange, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.videoCaptureTargetFrameRate = targetFrameRate.instance
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isRecording(pigeon_instance: CameraController, callback: (Result<Boolean>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.isRecording
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun startRecording(
        pigeon_instance: CameraController,
        outputOptions: FileOutputOptions,
        audioConfig: AudioConfig,
        listener: VideoRecordEventConsumer,
        callback: (Result<Recording>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val executor = ContextCompat.getMainExecutor(registrar.context)
                val recording = pigeon_instance.startRecording(outputOptions, audioConfig, executor, listener)
                callback(Result.success(recording))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}

val CameraControllerUseCaseApi.impl: Int
    get() = when (this) {
        CameraControllerUseCaseApi.IMAGE_CAPTURE -> CameraController.IMAGE_CAPTURE
        CameraControllerUseCaseApi.IMAGE_ANALYSIS -> CameraController.IMAGE_ANALYSIS
        CameraControllerUseCaseApi.VIDEO_CAPTURE -> CameraController.VIDEO_CAPTURE
    }