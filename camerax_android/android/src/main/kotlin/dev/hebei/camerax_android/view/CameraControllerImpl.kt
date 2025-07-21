package dev.hebei.camerax_android.view

import androidx.camera.core.CameraControl
import androidx.camera.core.CameraInfo
import androidx.camera.core.CameraSelector
import androidx.camera.core.DynamicRange
import androidx.camera.core.ExperimentalZeroShutterLag
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageCapture
import androidx.camera.core.resolutionselector.ResolutionSelector
import androidx.camera.video.FileOutputOptions
import androidx.camera.video.QualitySelector
import androidx.camera.video.Recording
import androidx.camera.view.CameraController
import androidx.camera.view.video.AudioConfig
import androidx.core.content.ContextCompat
import com.google.common.util.concurrent.FutureCallback
import com.google.common.util.concurrent.Futures
import dev.hebei.camerax_android.BackpressureStrategyApi
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.CaptureModeApi
import dev.hebei.camerax_android.FlashModeApi
import dev.hebei.camerax_android.ImageFormatApi
import dev.hebei.camerax_android.MirrorModeApi
import dev.hebei.camerax_android.PigeonApiCameraControllerApi
import dev.hebei.camerax_android.UseCaseApi
import dev.hebei.camerax_android.common.IntRange
import dev.hebei.camerax_android.common.TorchStateLiveData
import dev.hebei.camerax_android.common.VideoRecordEventConsumer
import dev.hebei.camerax_android.common.ZoomStateLiveData
import dev.hebei.camerax_android.core.backpressureStrategyApi
import dev.hebei.camerax_android.core.captureModeApi
import dev.hebei.camerax_android.core.flashModeApi
import dev.hebei.camerax_android.core.imageAnalysisImageFormatApi
import dev.hebei.camerax_android.core.imageAnalysisImpl
import dev.hebei.camerax_android.core.impl
import dev.hebei.camerax_android.core.mirrorModeApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.guava.await
import kotlinx.coroutines.launch

class CameraControllerImpl(private val impl: CameraXImpl) : PigeonApiCameraControllerApi(impl) {
    override fun initialize(pigeon_instance: CameraController, callback: (Result<Unit>) -> Unit) {
        val future = pigeon_instance.initializationFuture
        val executor = ContextCompat.getMainExecutor(impl.context)
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

    override fun getTorchState(pigeon_instance: CameraController, callback: (Result<TorchStateLiveData>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = TorchStateLiveData(pigeon_instance.torchState)
                callback(Result.success(value))
            } catch (e: Exception) {
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

    override fun getZoomState(pigeon_instance: CameraController, callback: (Result<ZoomStateLiveData>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = ZoomStateLiveData(pigeon_instance.zoomState)
                callback(Result.success(value))
            } catch (e: Exception) {
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
        pigeon_instance: CameraController, enabledUseCases: List<UseCaseApi>, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setEnabledUseCases(
                    enabledUseCases.fold(0) { total, next -> total or next.impl })
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

    override fun getImageCaptureMode(pigeon_instance: CameraController, callback: (Result<CaptureModeApi>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.imageCaptureMode.captureModeApi
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    @ExperimentalZeroShutterLag
    override fun setImageCaptureMode(
        pigeon_instance: CameraController, captureMode: CaptureModeApi, callback: (Result<Unit>) -> Unit
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

    override fun getImageCaptureFlashMode(pigeon_instance: CameraController, callback: (Result<FlashModeApi>) -> Unit) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.imageCaptureFlashMode.flashModeApi
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageCaptureFlashMode(
        pigeon_instance: CameraController, flashMode: FlashModeApi, callback: (Result<Unit>) -> Unit
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
                val executor = ContextCompat.getMainExecutor(impl.context)
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
        pigeon_instance: CameraController, callback: (Result<BackpressureStrategyApi>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.imageAnalysisBackpressureStrategy.backpressureStrategyApi
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageAnalysisBackpressureStrategy(
        pigeon_instance: CameraController, strategy: BackpressureStrategyApi, callback: (Result<Unit>) -> Unit
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
        pigeon_instance: CameraController, callback: (Result<ImageFormatApi>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.imageAnalysisOutputImageFormat.imageAnalysisImageFormatApi
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageAnalysisOutputImageFormat(
        pigeon_instance: CameraController,
        imageAnalysisOutputImageFormat: ImageFormatApi,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageAnalysisOutputImageFormat = imageAnalysisOutputImageFormat.imageAnalysisImpl
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
                val executor = ContextCompat.getMainExecutor(impl.context)
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
                val executor = ContextCompat.getMainExecutor(impl.context)
                val recording = pigeon_instance.startRecording(outputOptions, audioConfig, executor, listener)
                callback(Result.success(recording))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}

val UseCaseApi.impl
    get() = when (this) {
        UseCaseApi.IMAGE_CAPTURE -> CameraController.IMAGE_CAPTURE
        UseCaseApi.IMAGE_ANALYSIS -> CameraController.IMAGE_ANALYSIS
        UseCaseApi.VIDEO_CAPTURE -> CameraController.VIDEO_CAPTURE
    }