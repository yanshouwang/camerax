package dev.hebei.camerax_android.legacy.view

import androidx.core.content.ContextCompat
import androidx.lifecycle.map
import com.google.common.util.concurrent.FutureCallback
import com.google.common.util.concurrent.Futures
import dev.hebei.camerax_android.legacy.*
import dev.hebei.camerax_android.legacy.core.*
import dev.hebei.camerax_android.legacy.common.IntRange
import dev.hebei.camerax_android.legacy.common.TorchStateLiveData
import dev.hebei.camerax_android.legacy.common.ZoomStateLiveData
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.guava.await
import kotlinx.coroutines.launch

class CameraController(private val registrar: CameraXRegistrar) : PigeonApiCameraController(registrar) {
    override fun initialize(pigeon_instance: androidx.camera.view.CameraController, callback: (Result<Unit>) -> Unit) {
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
        pigeon_instance: androidx.camera.view.CameraController,
        cameraSelector: androidx.camera.core.CameraSelector,
        callback: (Result<Boolean>) -> Unit
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

    override fun getCameraSelector(
        pigeon_instance: androidx.camera.view.CameraController,
        callback: (Result<androidx.camera.core.CameraSelector>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.getCameraSelector()
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setCameraSelector(
        pigeon_instance: androidx.camera.view.CameraController,
        cameraSelector: androidx.camera.core.CameraSelector,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setCameraSelector(cameraSelector)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getCameraInfo(
        pigeon_instance: androidx.camera.view.CameraController,
        callback: (Result<androidx.camera.core.CameraInfo?>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.getCameraInfo()
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getCameraControl(
        pigeon_instance: androidx.camera.view.CameraController,
        callback: (Result<androidx.camera.core.CameraControl?>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.getCameraControl()
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getTorchState(
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<TorchStateLiveData.Stub>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val obj = pigeon_instance.getTorchState().map { state -> state.torchStateArgs }
                val value = TorchStateLiveData.Stub(obj)
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun enableTorch(
        pigeon_instance: androidx.camera.view.CameraController, torchEnabled: Boolean, callback: (Result<Unit>) -> Unit
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

    override fun getZoomState(
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<ZoomStateLiveData.Stub>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val obj = pigeon_instance.getZoomState()
                val value = ZoomStateLiveData.Stub(obj)
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setZoomRatio(
        pigeon_instance: androidx.camera.view.CameraController, zoomRatio: Double, callback: (Result<Unit>) -> Unit
    ) {
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
        pigeon_instance: androidx.camera.view.CameraController, linearZoom: Double, callback: (Result<Unit>) -> Unit
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

    override fun isPinchToZoomEnabled(
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.isPinchToZoomEnabled()
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setPinchToZoomEnabled(
        pigeon_instance: androidx.camera.view.CameraController, enabled: Boolean, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setPinchToZoomEnabled(enabled)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isTapToFocusEnabled(
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.isTapToFocusEnabled()
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setTapToFocusEnabled(
        pigeon_instance: androidx.camera.view.CameraController, enabled: Boolean, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setTapToFocusEnabled(enabled)
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isImageCaptureEnabled(
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.isImageCaptureEnabled
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isImageAnalysisEnabled(
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.isImageAnalysisEnabled
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isVideoCaptureEnabled(
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<Boolean>) -> Unit
    ) {
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
        pigeon_instance: androidx.camera.view.CameraController,
        enabledUseCases: List<UseCase>,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.setEnabledUseCases(
                    enabledUseCases.fold(0) { total, next -> total or next.obj })
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getPreviewResolutionSelector(
        pigeon_instance: androidx.camera.view.CameraController,
        callback: (Result<androidx.camera.core.resolutionselector.ResolutionSelector?>) -> Unit
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
        pigeon_instance: androidx.camera.view.CameraController,
        resolutionSelector: androidx.camera.core.resolutionselector.ResolutionSelector?,
        callback: (Result<Unit>) -> Unit
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
        pigeon_instance: androidx.camera.view.CameraController,
        callback: (Result<androidx.camera.core.resolutionselector.ResolutionSelector?>) -> Unit
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
        pigeon_instance: androidx.camera.view.CameraController,
        resolutionSelector: androidx.camera.core.resolutionselector.ResolutionSelector?,
        callback: (Result<Unit>) -> Unit
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
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<CaptureMode>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.imageCaptureMode.captureModeArgs
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageCaptureMode(
        pigeon_instance: androidx.camera.view.CameraController,
        captureMode: CaptureMode,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageCaptureMode = captureMode.obj
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getImageCaptureFlashMode(
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<FlashMode>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.imageCaptureFlashMode.flashModeArgs
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageCaptureFlashMode(
        pigeon_instance: androidx.camera.view.CameraController, flashMode: FlashMode, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageCaptureFlashMode = flashMode.obj
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getImageAnalysisResolutionSelector(
        pigeon_instance: androidx.camera.view.CameraController,
        callback: (Result<androidx.camera.core.resolutionselector.ResolutionSelector?>) -> Unit
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
        pigeon_instance: androidx.camera.view.CameraController,
        resolutionSelector: androidx.camera.core.resolutionselector.ResolutionSelector?,
        callback: (Result<Unit>) -> Unit
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
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<BackpressureStrategy>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.imageAnalysisBackpressureStrategy.backpressureStrategyArgs
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageAnalysisBackpressureStrategy(
        pigeon_instance: androidx.camera.view.CameraController,
        strategy: BackpressureStrategy,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageAnalysisBackpressureStrategy = strategy.obj
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getImageAnalysisImageQueueDepth(
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<Long>) -> Unit
    ) {
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
        pigeon_instance: androidx.camera.view.CameraController, depth: Long, callback: (Result<Unit>) -> Unit
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
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<ImageFormat>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.imageAnalysisOutputImageFormat.imageAnalysisImageFormatArgs
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageAnalysisOutputImageFormat(
        pigeon_instance: androidx.camera.view.CameraController,
        imageAnalysisOutputImageFormat: ImageFormat,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.imageAnalysisOutputImageFormat = imageAnalysisOutputImageFormat.imageAnalysisObj
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setImageAnalysisAnalyzer(
        pigeon_instance: androidx.camera.view.CameraController,
        analyzer: androidx.camera.core.ImageAnalysis.Analyzer,
        callback: (Result<Unit>) -> Unit
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

    override fun clearImageAnalysisAnalyzer(
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<Unit>) -> Unit
    ) {
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
        pigeon_instance: androidx.camera.view.CameraController,
        callback: (Result<androidx.camera.core.DynamicRange>) -> Unit
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
        pigeon_instance: androidx.camera.view.CameraController,
        dynamicRange: androidx.camera.core.DynamicRange,
        callback: (Result<Unit>) -> Unit
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
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<MirrorMode>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.videoCaptureMirrorMode.mirrorModeArgs
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setVideoCaptureMirrorMode(
        pigeon_instance: androidx.camera.view.CameraController, mirrorMode: MirrorMode, callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.videoCaptureMirrorMode = mirrorMode.obj
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun getVideoCaptureQualitySelector(
        pigeon_instance: androidx.camera.view.CameraController,
        callback: (Result<androidx.camera.video.QualitySelector>) -> Unit
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
        pigeon_instance: androidx.camera.view.CameraController,
        qualitySelector: androidx.camera.video.QualitySelector,
        callback: (Result<Unit>) -> Unit
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
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<IntRange.Stub>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val obj = pigeon_instance.videoCaptureTargetFrameRate
                val value = IntRange.Stub(obj)
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun setVideoCaptureTargetFrameRate(
        pigeon_instance: androidx.camera.view.CameraController,
        targetFrameRate: IntRange.Stub,
        callback: (Result<Unit>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                pigeon_instance.videoCaptureTargetFrameRate = targetFrameRate.obj
                callback(Result.success(Unit))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }

    override fun isRecording(
        pigeon_instance: androidx.camera.view.CameraController, callback: (Result<Boolean>) -> Unit
    ) {
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val value = pigeon_instance.isRecording
                callback(Result.success(value))
            } catch (e: Exception) {
                callback(Result.failure(e))
            }
        }
    }
}