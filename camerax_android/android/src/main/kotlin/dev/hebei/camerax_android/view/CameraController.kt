package dev.hebei.camerax_android.view

import android.os.Build
import android.util.Range
import androidx.annotation.FloatRange
import androidx.annotation.RequiresApi
import androidx.camera.core.ExperimentalZeroShutterLag
import androidx.core.util.Consumer
import androidx.lifecycle.LiveData
import androidx.lifecycle.map
import dev.hebei.camerax_android.core.CameraControl
import dev.hebei.camerax_android.core.CameraInfo
import dev.hebei.camerax_android.core.CameraSelector
import dev.hebei.camerax_android.core.DynamicRange
import dev.hebei.camerax_android.core.ImageAnalysis
import dev.hebei.camerax_android.core.ImageCapture
import dev.hebei.camerax_android.core.ImageFormat
import dev.hebei.camerax_android.core.MirrorMode
import dev.hebei.camerax_android.core.ZoomState
import dev.hebei.camerax_android.core.backpressureStrategyArgs
import dev.hebei.camerax_android.core.flashModeArgs
import dev.hebei.camerax_android.core.imageAnalysisImageFormatArgs
import dev.hebei.camerax_android.core.imageAnalysisObj
import dev.hebei.camerax_android.core.imageCaptureModeArgs
import dev.hebei.camerax_android.core.mirrorModeArgs
import dev.hebei.camerax_android.core.obj
import dev.hebei.camerax_android.core.resolutionselector.ResolutionSelector
import dev.hebei.camerax_android.core.torchStateArgs
import dev.hebei.camerax_android.video.FileDescriptorOutputOptions
import dev.hebei.camerax_android.video.FileOutputOptions
import dev.hebei.camerax_android.video.MediaStoreOutputOptions
import dev.hebei.camerax_android.video.QualitySelector
import dev.hebei.camerax_android.video.Recording
import dev.hebei.camerax_android.video.VideoRecordEvent
import dev.hebei.camerax_android.view.video.AudioConfig
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.guava.await
import kotlinx.coroutines.withContext
import java.util.concurrent.Executor

abstract class CameraController {
    companion object {
        const val IMAGE_CAPTURE = androidx.camera.view.CameraController.IMAGE_CAPTURE
        const val IMAGE_ANALYSIS = androidx.camera.view.CameraController.IMAGE_ANALYSIS
        const val VIDEO_CAPTURE = androidx.camera.view.CameraController.VIDEO_CAPTURE
    }

    internal abstract val obj: androidx.camera.view.CameraController

    suspend fun initialize() {
        obj.initializationFuture.await()
    }

    suspend fun hasCamera(cameraSelector: CameraSelector): Boolean {
        return withContext(Dispatchers.Main) {
            obj.hasCamera(cameraSelector.obj)
        }
    }

    suspend fun getCameraSelector(): CameraSelector {
        return withContext(Dispatchers.Main) {
            val obj = this@CameraController.obj.cameraSelector
            CameraSelector(obj)
        }
    }

    suspend fun setCameraSelector(cameraSelector: CameraSelector) {
        withContext(Dispatchers.Main) {
            obj.cameraSelector = cameraSelector.obj
        }
    }

    suspend fun getCameraInfo(): CameraInfo? {
        return withContext(Dispatchers.Main) {
            val obj = this@CameraController.obj.cameraInfo
            if (obj == null) null
            else CameraInfo(obj)
        }
    }

    suspend fun getCameraControl(): CameraControl? {
        return withContext(Dispatchers.Main) {
            val obj = this@CameraController.obj.cameraControl
            if (obj == null) null
            else CameraControl(obj)
        }
    }

    suspend fun getTorchState(): LiveData<Boolean> {
        return withContext(Dispatchers.Main) {
            obj.torchState.map { obj -> obj.torchStateArgs }
        }
    }

    suspend fun enableTorch(torchEnabled: Boolean) {
        obj.enableTorch(torchEnabled).await()
    }

    suspend fun getZoomState(): LiveData<ZoomState> {
        return withContext(Dispatchers.Main) {
            obj.zoomState.map { obj -> ZoomState(obj) }
        }
    }

    suspend fun setZoomRatio(zoomRatio: Float) {
        obj.setZoomRatio(zoomRatio).await()
    }

    suspend fun setLinearZoom(@FloatRange(from = 0.0, to = 1.0) linearZoom: Float) {
        obj.setLinearZoom(linearZoom).await()
    }

    suspend fun isPinchToZoomEnabled(): Boolean {
        return withContext(Dispatchers.Main) {
            obj.isPinchToZoomEnabled
        }
    }

    suspend fun setPinchToZoomEnabled(enabled: Boolean) {
        withContext(Dispatchers.Main) {
            obj.isPinchToZoomEnabled = enabled
        }
    }

    suspend fun isTapToFocusEnabled(): Boolean {
        return withContext(Dispatchers.Main) {
            obj.isTapToFocusEnabled
        }
    }

    suspend fun setTapToFocusEnabled(enabled: Boolean) {
        withContext(Dispatchers.Main) {
            obj.isTapToFocusEnabled = enabled
        }
    }

    suspend fun isImageCaptureEnabled(): Boolean {
        return withContext(Dispatchers.Main) {
            obj.isImageCaptureEnabled
        }
    }

    suspend fun isImageAnalysisEnabled(): Boolean {
        return withContext(Dispatchers.Main) {
            obj.isImageAnalysisEnabled
        }
    }

    suspend fun isVideoCaptureEnabled(): Boolean {
        return withContext(Dispatchers.Main) {
            obj.isVideoCaptureEnabled
        }
    }

    suspend fun setEnabledUseCases(enabledUseCases: Int) {
        withContext(Dispatchers.Main) {
            obj.setEnabledUseCases(enabledUseCases)
        }
    }

    suspend fun getPreviewResolutionSelector(): ResolutionSelector? {
        return withContext(Dispatchers.Main) {
            val obj = this@CameraController.obj.previewResolutionSelector
            if (obj == null) null
            else ResolutionSelector(obj)
        }
    }

    suspend fun setPreviewResolutionSelector(resolutionSelector: ResolutionSelector?) {
        withContext(Dispatchers.Main) {
            obj.previewResolutionSelector = resolutionSelector?.obj
        }
    }

    suspend fun getImageCaptureResolutionSelector(): ResolutionSelector? {
        return withContext(Dispatchers.Main) {
            val obj = this@CameraController.obj.imageCaptureResolutionSelector
            if (obj == null) null
            else ResolutionSelector(obj)
        }
    }

    suspend fun setImageCaptureResolutionSelector(resolutionSelector: ResolutionSelector?) {
        withContext(Dispatchers.Main) {
            obj.imageCaptureResolutionSelector = resolutionSelector?.obj
        }
    }

    suspend fun getImageCaptureMode(): ImageCapture.CaptureMode {
        return withContext(Dispatchers.Main) {
            obj.imageCaptureMode.imageCaptureModeArgs
        }
    }

    @ExperimentalZeroShutterLag
    suspend fun setImageCaptureMode(captureMode: ImageCapture.CaptureMode) {
        withContext(Dispatchers.Main) {
            obj.imageCaptureMode = captureMode.obj
        }
    }

    suspend fun getImageCaptureFlashMode(): ImageCapture.FlashMode {
        return withContext(Dispatchers.Main) {
            obj.imageCaptureFlashMode.flashModeArgs
        }
    }

    suspend fun setImageCaptureFlashMode(flashMode: ImageCapture.FlashMode) {
        withContext(Dispatchers.Main) {
            obj.imageCaptureFlashMode = flashMode.obj
        }
    }

    suspend fun getImageCaptureIoExecutor(): Executor? {
        return withContext(Dispatchers.Main) {
            obj.imageCaptureIoExecutor
        }
    }

    suspend fun setImageCaptureIoExecutor(executor: Executor?) {
        withContext(Dispatchers.Main) {
            obj.imageCaptureIoExecutor = executor
        }
    }

    suspend fun takePicture(
        executor: Executor, callback: ImageCapture.OnImageCapturedCallback
    ) {
        withContext(Dispatchers.Main) {
            obj.takePicture(executor, callback.obj)
        }
    }

    suspend fun takePicture(
        outputFileOptions: ImageCapture.OutputFileOptions,
        executor: Executor,
        callback: ImageCapture.OnImageSavedCallback
    ) {
        withContext(Dispatchers.Main) {
            obj.takePicture(outputFileOptions.obj, executor, callback.obj)
        }
    }

    suspend fun getImageAnalysisResolutionSelector(): ResolutionSelector? {
        return withContext(Dispatchers.Main) {
            val obj = this@CameraController.obj.imageAnalysisResolutionSelector
            if (obj == null) null
            else ResolutionSelector(obj)
        }
    }

    suspend fun setImageAnalysisResolutionSelector(resolutionSelector: ResolutionSelector?) {
        withContext(Dispatchers.Main) {
            obj.imageAnalysisResolutionSelector = resolutionSelector?.obj
        }
    }

    suspend fun getImageAnalysisBackpressureStrategy(): ImageAnalysis.BackpressureStrategy {
        return withContext(Dispatchers.Main) {
            obj.imageAnalysisBackpressureStrategy.backpressureStrategyArgs
        }
    }

    suspend fun setImageAnalysisBackpressureStrategy(backpressureStrategy: ImageAnalysis.BackpressureStrategy) {
        withContext(Dispatchers.Main) {
            obj.imageAnalysisBackpressureStrategy = backpressureStrategy.obj
        }
    }

    suspend fun getImageAnalysisImageQueueDepth(): Int {
        return withContext(Dispatchers.Main) {
            obj.imageAnalysisImageQueueDepth
        }
    }

    suspend fun setImageAnalysisImageQueueDepth(imageQueueDepth: Int) {
        withContext(Dispatchers.Main) {
            obj.imageAnalysisImageQueueDepth = imageQueueDepth
        }
    }

    suspend fun getImageAnalysisOutputImageFormat(): ImageFormat {
        return withContext(Dispatchers.Main) {
            obj.imageAnalysisOutputImageFormat.imageAnalysisImageFormatArgs
        }
    }

    suspend fun setImageAnalysisOutputImageFormat(outputImageFormat: ImageFormat) {
        withContext(Dispatchers.Main) {
            obj.imageAnalysisOutputImageFormat = outputImageFormat.imageAnalysisObj
        }
    }

    suspend fun getImageAnalysisBackgroundExecutor(): Executor? {
        return withContext(Dispatchers.Main) {
            obj.imageAnalysisBackgroundExecutor
        }
    }

    suspend fun setImageAnalysisBackgroundExecutor(executor: Executor?) {
        withContext(Dispatchers.Main) {
            obj.imageAnalysisBackgroundExecutor = executor
        }
    }

    suspend fun setImageAnalysisAnalyzer(executor: Executor, analyzer: ImageAnalysis.Analyzer) {
        withContext(Dispatchers.Main) {
            obj.setImageAnalysisAnalyzer(executor, analyzer.obj)
        }
    }

    suspend fun clearImageAnalysisAnalyzer() {
        withContext(Dispatchers.Main) {
            obj.clearImageAnalysisAnalyzer()
        }
    }

    suspend fun getVideoCaptureDynamicRange(): DynamicRange {
        return withContext(Dispatchers.Main) {
            val obj = this@CameraController.obj.videoCaptureDynamicRange
            DynamicRange(obj)
        }
    }

    suspend fun setVideoCaptureDynamicRange(dyanmicRange: DynamicRange) {
        withContext(Dispatchers.Main) {
            obj.videoCaptureDynamicRange = dyanmicRange.obj
        }
    }

    suspend fun getVideoCaptureMirrorMode(): MirrorMode {
        return withContext(Dispatchers.Main) {
            obj.videoCaptureMirrorMode.mirrorModeArgs
        }
    }

    suspend fun setVideoCaptureMirrorMode(mirrorMode: MirrorMode) {
        withContext(Dispatchers.Main) {
            obj.videoCaptureMirrorMode = mirrorMode.obj
        }
    }

    suspend fun getVideoCaptureQualitySelector(): QualitySelector {
        return withContext(Dispatchers.Main) {
            val obj = this@CameraController.obj.videoCaptureQualitySelector
            QualitySelector(obj)
        }
    }

    suspend fun setVideoCaptureQualitySelector(qualitySelector: QualitySelector) {
        withContext(Dispatchers.Main) {
            obj.videoCaptureQualitySelector = qualitySelector.obj
        }
    }

    suspend fun getVideoCaptureTargetFrameRate(): Range<Int> {
        return withContext(Dispatchers.Main) {
            obj.videoCaptureTargetFrameRate
        }
    }

    suspend fun setVideoCaptureTargetFrameRate(targetFrameRate: Range<Int>) {
        withContext(Dispatchers.Main) {
            obj.videoCaptureTargetFrameRate = targetFrameRate
        }
    }

    suspend fun isRecording(): Boolean {
        return withContext(Dispatchers.Main) {
            obj.isRecording
        }
    }

    suspend fun startRecording(
        outputOptions: FileOutputOptions,
        audioConfig: AudioConfig,
        executor: Executor,
        listener: Consumer<VideoRecordEvent>
    ): Recording {
        return withContext(Dispatchers.Main) {
            val obj = this@CameraController.obj.startRecording(
                outputOptions.obj, audioConfig.obj, executor
            ) { event ->
                val eventArgs = when (event) {
                    is androidx.camera.video.VideoRecordEvent.Status -> VideoRecordEvent.Status(
                        event
                    )

                    is androidx.camera.video.VideoRecordEvent.Start -> VideoRecordEvent.Start(event)
                    is androidx.camera.video.VideoRecordEvent.Pause -> VideoRecordEvent.Pause(event)
                    is androidx.camera.video.VideoRecordEvent.Resume -> VideoRecordEvent.Resume(
                        event
                    )

                    is androidx.camera.video.VideoRecordEvent.Finalize -> VideoRecordEvent.Finalize(
                        event
                    )

                    else -> throw TypeCastException()
                }
                listener.accept(eventArgs)
            }
            Recording(obj)
        }
    }

    suspend fun startRecording(
        outputOptions: MediaStoreOutputOptions,
        audioConfig: AudioConfig,
        executor: Executor,
        listener: Consumer<VideoRecordEvent>
    ): Recording {

        return withContext(Dispatchers.Main) {
            val obj = this@CameraController.obj.startRecording(
                outputOptions.obj, audioConfig.obj, executor
            ) { event ->
                val eventArgs = when (event) {
                    is androidx.camera.video.VideoRecordEvent.Status -> VideoRecordEvent.Status(
                        event
                    )

                    is androidx.camera.video.VideoRecordEvent.Start -> VideoRecordEvent.Start(event)
                    is androidx.camera.video.VideoRecordEvent.Pause -> VideoRecordEvent.Pause(event)
                    is androidx.camera.video.VideoRecordEvent.Resume -> VideoRecordEvent.Resume(
                        event
                    )

                    is androidx.camera.video.VideoRecordEvent.Finalize -> VideoRecordEvent.Finalize(
                        event
                    )

                    else -> throw TypeCastException()
                }
                listener.accept(eventArgs)
            }
            Recording(obj)
        }
    }

    @RequiresApi(Build.VERSION_CODES.O)
    suspend fun startRecording(
        outputOptions: FileDescriptorOutputOptions,
        audioConfig: AudioConfig,
        executor: Executor,
        listener: Consumer<VideoRecordEvent>
    ): Recording {
        return withContext(Dispatchers.Main) {
            val obj = this@CameraController.obj.startRecording(
                outputOptions.obj, audioConfig.obj, executor
            ) { event ->
                val eventArgs = when (event) {
                    is androidx.camera.video.VideoRecordEvent.Status -> VideoRecordEvent.Status(
                        event
                    )

                    is androidx.camera.video.VideoRecordEvent.Start -> VideoRecordEvent.Start(event)
                    is androidx.camera.video.VideoRecordEvent.Pause -> VideoRecordEvent.Pause(event)
                    is androidx.camera.video.VideoRecordEvent.Resume -> VideoRecordEvent.Resume(
                        event
                    )

                    is androidx.camera.video.VideoRecordEvent.Finalize -> VideoRecordEvent.Finalize(
                        event
                    )

                    else -> throw TypeCastException()
                }
                listener.accept(eventArgs)
            }
            Recording(obj)
        }
    }
}