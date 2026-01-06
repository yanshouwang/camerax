package dev.zeekr.camerax_android.view

import androidx.camera.core.CameraControl
import androidx.camera.core.CameraInfo
import androidx.camera.core.CameraSelector
import androidx.camera.core.DynamicRange
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageCapture
import androidx.camera.core.resolutionselector.ResolutionSelector
import androidx.camera.video.FileOutputOptions
import androidx.camera.video.QualitySelector
import androidx.camera.video.Recording
import androidx.camera.view.CameraController
import androidx.camera.view.video.AudioConfig
import androidx.core.content.ContextCompat
import dev.zeekr.camerax_android.CameraControllerTapToFocusApi
import dev.zeekr.camerax_android.CameraControllerUseCaseApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.ImageAnalysisOutputImageFormatApi
import dev.zeekr.camerax_android.ImageAnalysisStrategyApi
import dev.zeekr.camerax_android.ImageCaptureCaptureModeApi
import dev.zeekr.camerax_android.ImageCaptureFlashModeApi
import dev.zeekr.camerax_android.MirrorModeApi
import dev.zeekr.camerax_android.PigeonApiCameraControllerProxyApi
import dev.zeekr.camerax_android.TimeUnitApi
import dev.zeekr.camerax_android.common.IntRange
import dev.zeekr.camerax_android.common.TapToFocusInfoLiveData
import dev.zeekr.camerax_android.common.TorchStateLiveData
import dev.zeekr.camerax_android.common.VideoRecordEventConsumer
import dev.zeekr.camerax_android.common.ZoomStateLiveData
import dev.zeekr.camerax_android.common.impl
import dev.zeekr.camerax_android.context
import dev.zeekr.camerax_android.core.imageAnalysisOutputImageFormatApi
import dev.zeekr.camerax_android.core.imageAnalysisStrategyApi
import dev.zeekr.camerax_android.core.imageCaptureCaptureModeApi
import dev.zeekr.camerax_android.core.imageCaptureFlashModeApi
import dev.zeekr.camerax_android.core.impl
import dev.zeekr.camerax_android.core.mirrorModeApi
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.guava.await
import kotlinx.coroutines.launch

class CameraControllerImpl(private val registrar: CameraXApiPigeonProxyApiRegistrar) :
    PigeonApiCameraControllerProxyApi(registrar) {
    override fun hasCamera(pigeon_instance: CameraController, cameraSelector: CameraSelector): Boolean {
        return pigeon_instance.hasCamera(cameraSelector)
    }

    override fun getCameraSelector(pigeon_instance: CameraController): CameraSelector {
        return pigeon_instance.cameraSelector
    }

    override fun setCameraSelector(pigeon_instance: CameraController, cameraSelector: CameraSelector) {
        pigeon_instance.cameraSelector = cameraSelector
    }

    override fun getCameraInfo(pigeon_instance: CameraController): CameraInfo? {
        return pigeon_instance.cameraInfo
    }

    override fun getCameraControl(pigeon_instance: CameraController): CameraControl? {
        return pigeon_instance.cameraControl
    }

    override fun getTorchState(pigeon_instance: CameraController): TorchStateLiveData {
        return TorchStateLiveData(pigeon_instance.torchState)
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

    override fun getZoomState(pigeon_instance: CameraController): ZoomStateLiveData {
        return ZoomStateLiveData(pigeon_instance.zoomState)
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

    override fun isPinchToZoomEnabled(pigeon_instance: CameraController): Boolean {
        return pigeon_instance.isPinchToZoomEnabled
    }

    override fun setPinchToZoomEnabled(pigeon_instance: CameraController, enabled: Boolean) {
        pigeon_instance.isPinchToZoomEnabled = enabled
    }

    override fun isTapToFocusEnabled(pigeon_instance: CameraController): Boolean {
        return pigeon_instance.isTapToFocusEnabled
    }

    override fun setTapToFocusEnabled(pigeon_instance: CameraController, enabled: Boolean) {
        pigeon_instance.isTapToFocusEnabled = enabled
    }

    override fun isImageCaptureEnabled(pigeon_instance: CameraController): Boolean {
        return pigeon_instance.isImageCaptureEnabled
    }

    override fun isImageAnalysisEnabled(pigeon_instance: CameraController): Boolean {
        return pigeon_instance.isImageAnalysisEnabled
    }

    override fun isVideoCaptureEnabled(pigeon_instance: CameraController): Boolean {
        return pigeon_instance.isVideoCaptureEnabled
    }

    override fun setEnabledUseCases(
        pigeon_instance: CameraController, enabledUseCases: List<CameraControllerUseCaseApi>
    ) {
        pigeon_instance.setEnabledUseCases(enabledUseCases.map { it.impl }.reduce { acc, i -> acc or i })
    }

    override fun getPreviewResolutionSelector(pigeon_instance: CameraController): ResolutionSelector? {
        return pigeon_instance.previewResolutionSelector
    }

    override fun getTapToFocusInfoState(pigeon_instance: CameraController): TapToFocusInfoLiveData {
        return TapToFocusInfoLiveData(pigeon_instance.tapToFocusInfoState)
    }

    override fun setPreviewResolutionSelector(
        pigeon_instance: CameraController, resolutionSelector: ResolutionSelector?
    ) {
        pigeon_instance.previewResolutionSelector = resolutionSelector
    }

    override fun setTapToFocusAutoCancelDuration(
        pigeon_instance: CameraController, duration: Long, timeUnit: TimeUnitApi
    ) {
        pigeon_instance.setTapToFocusAutoCancelDuration(duration, timeUnit.impl)
    }

    override fun getImageCaptureResolutionSelector(pigeon_instance: CameraController): ResolutionSelector? {
        return pigeon_instance.imageCaptureResolutionSelector
    }

    override fun setImageCaptureResolutionSelector(
        pigeon_instance: CameraController, resolutionSelector: ResolutionSelector?
    ) {
        pigeon_instance.imageCaptureResolutionSelector = resolutionSelector
    }

    override fun getImageCaptureMode(pigeon_instance: CameraController): ImageCaptureCaptureModeApi {
        return pigeon_instance.imageCaptureMode.imageCaptureCaptureModeApi
    }

    override fun setImageCaptureMode(pigeon_instance: CameraController, captureMode: ImageCaptureCaptureModeApi) {
        pigeon_instance.imageCaptureMode = captureMode.impl
    }

    override fun getImageCaptureFlashMode(pigeon_instance: CameraController): ImageCaptureFlashModeApi {
        return pigeon_instance.imageCaptureFlashMode.imageCaptureFlashModeApi
    }

    override fun setImageCaptureFlashMode(pigeon_instance: CameraController, flashMode: ImageCaptureFlashModeApi) {
        pigeon_instance.imageCaptureFlashMode = flashMode.impl
    }

    override fun takePicture1(
        pigeon_instance: CameraController, imageCapturedCallback: ImageCapture.OnImageCapturedCallback
    ) {
        val executor = ContextCompat.getMainExecutor(registrar.context)
        pigeon_instance.takePicture(executor, imageCapturedCallback)
    }

    override fun getImageAnalysisResolutionSelector(pigeon_instance: CameraController): ResolutionSelector? {
        return pigeon_instance.imageAnalysisResolutionSelector
    }

    override fun setImageAnalysisResolutionSelector(
        pigeon_instance: CameraController, resolutionSelector: ResolutionSelector?
    ) {
        pigeon_instance.imageAnalysisResolutionSelector = resolutionSelector
    }

    override fun getImageAnalysisBackpressureStrategy(pigeon_instance: CameraController): ImageAnalysisStrategyApi {
        return pigeon_instance.imageAnalysisBackpressureStrategy.imageAnalysisStrategyApi
    }

    override fun setImageAnalysisBackpressureStrategy(
        pigeon_instance: CameraController, strategy: ImageAnalysisStrategyApi
    ) {
        pigeon_instance.imageAnalysisBackpressureStrategy = strategy.impl
    }

    override fun getImageAnalysisImageQueueDepth(pigeon_instance: CameraController): Long {
        return pigeon_instance.imageAnalysisImageQueueDepth.toLong()
    }

    override fun setImageAnalysisImageQueueDepth(pigeon_instance: CameraController, depth: Long) {
        pigeon_instance.imageAnalysisImageQueueDepth = depth.toInt()
    }

    override fun getImageAnalysisOutputImageFormat(pigeon_instance: CameraController): ImageAnalysisOutputImageFormatApi {
        return pigeon_instance.imageAnalysisOutputImageFormat.imageAnalysisOutputImageFormatApi
    }

    override fun setImageAnalysisOutputImageFormat(
        pigeon_instance: CameraController, imageAnalysisOutputImageFormat: ImageAnalysisOutputImageFormatApi
    ) {
        pigeon_instance.imageAnalysisOutputImageFormat = imageAnalysisOutputImageFormat.impl
    }

    override fun setImageAnalysisAnalyzer(pigeon_instance: CameraController, analyzer: ImageAnalysis.Analyzer) {
        val executor = ContextCompat.getMainExecutor(registrar.context)
        pigeon_instance.setImageAnalysisAnalyzer(executor, analyzer)
    }

    override fun clearImageAnalysisAnalyzer(pigeon_instance: CameraController) {
        pigeon_instance.clearImageAnalysisAnalyzer()
    }

    override fun getVideoCaptureDynamicRange(pigeon_instance: CameraController): DynamicRange {
        return pigeon_instance.videoCaptureDynamicRange
    }

    override fun setVideoCaptureDynamicRange(pigeon_instance: CameraController, dynamicRange: DynamicRange) {
        pigeon_instance.videoCaptureDynamicRange = dynamicRange
    }

    override fun getVideoCaptureMirrorMode(pigeon_instance: CameraController): MirrorModeApi {
        return pigeon_instance.videoCaptureMirrorMode.mirrorModeApi
    }

    override fun setVideoCaptureMirrorMode(pigeon_instance: CameraController, mirrorMode: MirrorModeApi) {
        pigeon_instance.videoCaptureMirrorMode = mirrorMode.impl
    }

    override fun getVideoCaptureQualitySelector(pigeon_instance: CameraController): QualitySelector {
        return pigeon_instance.videoCaptureQualitySelector
    }

    override fun setVideoCaptureQualitySelector(pigeon_instance: CameraController, qualitySelector: QualitySelector) {
        pigeon_instance.videoCaptureQualitySelector = qualitySelector
    }

    override fun getVideoCaptureTargetFrameRate(pigeon_instance: CameraController): IntRange {
        return IntRange(pigeon_instance.videoCaptureTargetFrameRate)
    }

    override fun setVideoCaptureTargetFrameRate(pigeon_instance: CameraController, targetFrameRate: IntRange) {
        pigeon_instance.videoCaptureTargetFrameRate = targetFrameRate.instance
    }

    override fun isRecording(pigeon_instance: CameraController): Boolean {
        return pigeon_instance.isRecording
    }

    override fun startRecording1(
        pigeon_instance: CameraController,
        outputOptions: FileOutputOptions,
        audioConfig: AudioConfig,
        listener: VideoRecordEventConsumer
    ): Recording {
        val executor = ContextCompat.getMainExecutor(registrar.context)
        return pigeon_instance.startRecording(outputOptions, audioConfig, executor, listener)
    }
}

val Int.cameraControllerTapToFocusApi: CameraControllerTapToFocusApi
    get() = when (this) {
        CameraController.TAP_TO_FOCUS_NOT_STARTED -> CameraControllerTapToFocusApi.NOT_STARTED
        CameraController.TAP_TO_FOCUS_STARTED -> CameraControllerTapToFocusApi.STARTED
        CameraController.TAP_TO_FOCUS_FOCUSED -> CameraControllerTapToFocusApi.FOCUSED
        CameraController.TAP_TO_FOCUS_NOT_FOCUSED -> CameraControllerTapToFocusApi.NOT_FOCUSED
        CameraController.TAP_TO_FOCUS_FAILED -> CameraControllerTapToFocusApi.FAILED
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val CameraControllerTapToFocusApi.impl: Int
    get() = when (this) {
        CameraControllerTapToFocusApi.NOT_STARTED -> CameraController.TAP_TO_FOCUS_NOT_STARTED
        CameraControllerTapToFocusApi.STARTED -> CameraController.TAP_TO_FOCUS_STARTED
        CameraControllerTapToFocusApi.FOCUSED -> CameraController.TAP_TO_FOCUS_FOCUSED
        CameraControllerTapToFocusApi.NOT_FOCUSED -> CameraController.TAP_TO_FOCUS_NOT_FOCUSED
        CameraControllerTapToFocusApi.FAILED -> CameraController.TAP_TO_FOCUS_FAILED
    }

val CameraControllerUseCaseApi.impl: Int
    get() = when (this) {
        CameraControllerUseCaseApi.IMAGE_CAPTURE -> CameraController.IMAGE_CAPTURE
        CameraControllerUseCaseApi.IMAGE_ANALYSIS -> CameraController.IMAGE_ANALYSIS
        CameraControllerUseCaseApi.VIDEO_CAPTURE -> CameraController.VIDEO_CAPTURE
    }
