package dev.hebei.camerax_android.legacy

import android.app.Activity
import android.content.Context
import dev.hebei.camerax_android.legacy.core.CameraControl
import dev.hebei.camerax_android.legacy.core.CameraInfo
import dev.hebei.camerax_android.legacy.core.CameraSelector
import dev.hebei.camerax_android.legacy.core.CameraStateLiveData
import dev.hebei.camerax_android.legacy.core.CameraStateObserver
import dev.hebei.camerax_android.legacy.core.DurationArgs
import dev.hebei.camerax_android.legacy.core.DynamicRange
import dev.hebei.camerax_android.legacy.core.ExposureState
import dev.hebei.camerax_android.legacy.core.FocusMeteringAction
import dev.hebei.camerax_android.legacy.core.IntRange
import dev.hebei.camerax_android.legacy.core.MeteringPointArgs
import dev.hebei.camerax_android.legacy.core.PermissionManager
import dev.hebei.camerax_android.legacy.core.Rect
import dev.hebei.camerax_android.legacy.core.Size
import dev.hebei.camerax_android.legacy.core.TorchStateLiveData
import dev.hebei.camerax_android.legacy.core.TorchStateObserver
import dev.hebei.camerax_android.legacy.core.ZoomState
import dev.hebei.camerax_android.legacy.core.ZoomStateLiveData
import dev.hebei.camerax_android.legacy.core.ZoomStateObserver
import dev.hebei.camerax_android.legacy.core.resolutionselector.AspectRatioStrategy
import dev.hebei.camerax_android.legacy.view.CameraController
import dev.hebei.camerax_android.legacy.view.LifecycleCameraController
import dev.hebei.camerax_android.legacy.view.PreviewView
import io.flutter.plugin.common.BinaryMessenger

class CameraXRegistrar(val context: Context, messenger: BinaryMessenger) :
    CameraXPigeonProxyApiRegistrar(messenger) {
    var activity: Activity? = null

    override fun getPigeonApiPermissionManager(): PigeonApiPermissionManager {
        return PermissionManager(this)
    }

    override fun getPigeonApiThrowable(): PigeonApiThrowable {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiSize(): PigeonApiSize {
        return Size(this)
    }

    override fun getPigeonApiRect(): PigeonApiRect {
        return Rect(this)
    }

    override fun getPigeonApiIntRange(): PigeonApiIntRange {
        return IntRange(this)
    }

    override fun getPigeonApiCameraSelector(): PigeonApiCameraSelector {
        return CameraSelector(this)
    }

    override fun getPigeonApiCameraStateLiveData(): PigeonApiCameraStateLiveData {
        return CameraStateLiveData(this)
    }

    override fun getPigeonApiCameraStateObserver(): PigeonApiCameraStateObserver {
        return CameraStateObserver(this)
    }

    override fun getPigeonApiTorchStateLiveData(): PigeonApiTorchStateLiveData {
        return TorchStateLiveData(this)
    }

    override fun getPigeonApiTorchStateObserver(): PigeonApiTorchStateObserver {
        return TorchStateObserver(this)
    }

    override fun getPigeonApiZoomState(): PigeonApiZoomState {
        return ZoomState(this)
    }

    override fun getPigeonApiZoomStateLiveData(): PigeonApiZoomStateLiveData {
        return ZoomStateLiveData(this)
    }

    override fun getPigeonApiZoomStateObserver(): PigeonApiZoomStateObserver {
        return ZoomStateObserver(this)
    }

    override fun getPigeonApiExposureState(): PigeonApiExposureState {
        return ExposureState(this)
    }

    override fun getPigeonApiMeteringPointArgs(): PigeonApiMeteringPointArgs {
        return MeteringPointArgs(this)
    }

    override fun getPigeonApiDurationArgs(): PigeonApiDurationArgs {
        return DurationArgs(this)
    }

    override fun getPigeonApiFocusMeteringAction(): PigeonApiFocusMeteringAction {
        return FocusMeteringAction(this)
    }

    override fun getPigeonApiDynamicRange(): PigeonApiDynamicRange {
        return DynamicRange(this)
    }

    override fun getPigeonApiCameraInfo(): PigeonApiCameraInfo {
        return CameraInfo(this)
    }

    override fun getPigeonApiCameraControl(): PigeonApiCameraControl {
        return CameraControl(this)
    }

    override fun getPigeonApiAspectRatioStrategy(): PigeonApiAspectRatioStrategy {
        return AspectRatioStrategy(this)
    }

    override fun getPigeonApiResolutionFilter(): PigeonApiResolutionFilter {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiResolutionStrategy(): PigeonApiResolutionStrategy {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiResolutionSelector(): PigeonApiResolutionSelector {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiImageInfo(): PigeonApiImageInfo {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiPlaneProxy(): PigeonApiPlaneProxy {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiImageProxy(): PigeonApiImageProxy {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiAnalyzer(): PigeonApiAnalyzer {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiFallbackStrategy(): PigeonApiFallbackStrategy {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiQualitySelector(): PigeonApiQualitySelector {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiAudioConfig(): PigeonApiAudioConfig {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiAudioStats(): PigeonApiAudioStats {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiRecordingStats(): PigeonApiRecordingStats {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiVideoRecordEvent(): PigeonApiVideoRecordEvent {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiVideoRecordFinalizeEvent(): PigeonApiVideoRecordFinalizeEvent {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiVideoRecordEventConsumer(): PigeonApiVideoRecordEventConsumer {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiRecording(): PigeonApiRecording {
        TODO("Not yet implemented")
    }

    override fun getPigeonApiCameraController(): PigeonApiCameraController {
        return CameraController(this)
    }

    override fun getPigeonApiLifecycleCameraController(): PigeonApiLifecycleCameraController {
        return LifecycleCameraController(this)
    }

    override fun getPigeonApiPreviewView(): PigeonApiPreviewView {
        return PreviewView(this)
    }
}