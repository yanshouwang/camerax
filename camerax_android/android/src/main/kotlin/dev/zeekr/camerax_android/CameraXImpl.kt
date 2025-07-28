package dev.zeekr.camerax_android

import android.app.Activity
import android.content.Context
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import dev.zeekr.camerax_android.camera2.interop.Camera2CameraControlImpl
import dev.zeekr.camerax_android.camera2.interop.Camera2CameraInfoImpl
import dev.zeekr.camerax_android.camera2.interop.CaptureRequestOptionsImpl
import dev.zeekr.camerax_android.common.AutoCloseableImpl
import dev.zeekr.camerax_android.common.CameraStateLiveDataImpl
import dev.zeekr.camerax_android.common.CameraStateObserverImpl
import dev.zeekr.camerax_android.common.IntRangeImpl
import dev.zeekr.camerax_android.common.LocationImpl
import dev.zeekr.camerax_android.common.LongRangeImpl
import dev.zeekr.camerax_android.common.MlKitAnalyzerResultConsumerImpl
import dev.zeekr.camerax_android.common.PermissionManagerImpl
import dev.zeekr.camerax_android.common.PointFImpl
import dev.zeekr.camerax_android.common.PointImpl
import dev.zeekr.camerax_android.common.RectImpl
import dev.zeekr.camerax_android.common.SizeImpl
import dev.zeekr.camerax_android.common.TorchStateLiveDataImpl
import dev.zeekr.camerax_android.common.TorchStateObserverImpl
import dev.zeekr.camerax_android.common.VideoRecordEventConsumerImpl
import dev.zeekr.camerax_android.common.ZoomStateLiveDataImpl
import dev.zeekr.camerax_android.common.ZoomStateObserverImpl
import dev.zeekr.camerax_android.core.CameraControlImpl
import dev.zeekr.camerax_android.core.CameraInfoImpl
import dev.zeekr.camerax_android.core.CameraSelectorImpl
import dev.zeekr.camerax_android.core.DynamicRangeImpl
import dev.zeekr.camerax_android.core.ExposureStateImpl
import dev.zeekr.camerax_android.core.FocusMeteringActionImpl
import dev.zeekr.camerax_android.core.FocusMeteringResultImpl
import dev.zeekr.camerax_android.core.ImageAnalysisImpl
import dev.zeekr.camerax_android.core.ImageAnalyzerImpl
import dev.zeekr.camerax_android.core.ImageCaptureImpl
import dev.zeekr.camerax_android.core.ImageInfoImpl
import dev.zeekr.camerax_android.core.ImageProxyImpl
import dev.zeekr.camerax_android.core.MeteringPointFactoryImpl
import dev.zeekr.camerax_android.core.MeteringPointImpl
import dev.zeekr.camerax_android.core.SurfaceOrientedMeteringPointFactoryImpl
import dev.zeekr.camerax_android.core.ZoomStateImpl
import dev.zeekr.camerax_android.core.resolutionselector.AspectRatioStrategyImpl
import dev.zeekr.camerax_android.core.resolutionselector.ResolutionFilterImpl
import dev.zeekr.camerax_android.core.resolutionselector.ResolutionSelectorImpl
import dev.zeekr.camerax_android.core.resolutionselector.ResolutionStrategyImpl
import dev.zeekr.camerax_android.ml.DetectorImpl
import dev.zeekr.camerax_android.ml.MlKitAnalyzerImpl
import dev.zeekr.camerax_android.ml.barcode.BarcodeImpl
import dev.zeekr.camerax_android.ml.barcode.BarcodeScannerImpl
import dev.zeekr.camerax_android.ml.barcode.BarcodeScannerOptionsImpl
import dev.zeekr.camerax_android.ml.barcode.ZoomSuggestionOptionsImpl
import dev.zeekr.camerax_android.ml.face.FaceContourImpl
import dev.zeekr.camerax_android.ml.face.FaceDetectorImpl
import dev.zeekr.camerax_android.ml.face.FaceDetectorOptionsImpl
import dev.zeekr.camerax_android.ml.face.FaceImpl
import dev.zeekr.camerax_android.ml.face.FaceLandmarkImpl
import dev.zeekr.camerax_android.video.AudioStatsImpl
import dev.zeekr.camerax_android.video.FallbackStrategyImpl
import dev.zeekr.camerax_android.video.FileOutputOptionsImpl
import dev.zeekr.camerax_android.video.OutputOptionsImpl
import dev.zeekr.camerax_android.video.OutputResultsImpl
import dev.zeekr.camerax_android.video.QualityImpl
import dev.zeekr.camerax_android.video.QualitySelectorImpl
import dev.zeekr.camerax_android.video.RecordingImpl
import dev.zeekr.camerax_android.video.RecordingStatsImpl
import dev.zeekr.camerax_android.video.VideoRecordEventImpl
import dev.zeekr.camerax_android.view.CameraControllerImpl
import dev.zeekr.camerax_android.view.LifecycleCameraControllerImpl
import dev.zeekr.camerax_android.view.PreviewViewImpl
import dev.zeekr.camerax_android.view.video.AudioConfigImpl
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger

class CameraXImpl(binaryMessenger: BinaryMessenger, val context: Context) :
    CameraXApiPigeonProxyApiRegistrar(binaryMessenger), ActivityAware {
    var binding: ActivityPluginBinding? = null

    val activity: Activity get() = binding?.activity ?: throw NullPointerException("Activity binding is null")

    override fun getPigeonApiPermissionManagerApi(): PigeonApiPermissionManagerApi {
        return PermissionManagerImpl(this)
    }

    override fun getPigeonApiAutoCloseableApi(): PigeonApiAutoCloseableApi {
        return AutoCloseableImpl(this)
    }

    override fun getPigeonApiLocationApi(): PigeonApiLocationApi {
        return LocationImpl(this)
    }

    override fun getPigeonApiSizeApi(): PigeonApiSizeApi {
        return SizeImpl(this)
    }

    override fun getPigeonApiPointApi(): PigeonApiPointApi {
        return PointImpl(this)
    }

    override fun getPigeonApiPointFApi(): PigeonApiPointFApi {
        return PointFImpl(this)
    }

    override fun getPigeonApiRectApi(): PigeonApiRectApi {
        return RectImpl(this)
    }

    override fun getPigeonApiIntRangeApi(): PigeonApiIntRangeApi {
        return IntRangeImpl(this)
    }

    override fun getPigeonApiLongRangeApi(): PigeonApiLongRangeApi {
        return LongRangeImpl(this)
    }

    override fun getPigeonApiCameraSelectorApi(): PigeonApiCameraSelectorApi {
        return CameraSelectorImpl(this)
    }

    override fun getPigeonApiCameraStateLiveDataApi(): PigeonApiCameraStateLiveDataApi {
        return CameraStateLiveDataImpl(this)
    }

    override fun getPigeonApiCameraStateObserverApi(): PigeonApiCameraStateObserverApi {
        return CameraStateObserverImpl(this)
    }

    override fun getPigeonApiTorchStateLiveDataApi(): PigeonApiTorchStateLiveDataApi {
        return TorchStateLiveDataImpl(this)
    }

    override fun getPigeonApiTorchStateObserverApi(): PigeonApiTorchStateObserverApi {
        return TorchStateObserverImpl(this)
    }

    override fun getPigeonApiZoomStateApi(): PigeonApiZoomStateApi {
        return ZoomStateImpl(this)
    }

    override fun getPigeonApiZoomStateLiveDataApi(): PigeonApiZoomStateLiveDataApi {
        return ZoomStateLiveDataImpl(this)
    }

    override fun getPigeonApiZoomStateObserverApi(): PigeonApiZoomStateObserverApi {
        return ZoomStateObserverImpl(this)
    }

    override fun getPigeonApiExposureStateApi(): PigeonApiExposureStateApi {
        return ExposureStateImpl(this)
    }

    override fun getPigeonApiMeteringPointApi(): PigeonApiMeteringPointApi {
        return MeteringPointImpl(this)
    }

    override fun getPigeonApiMeteringPointFactoryApi(): PigeonApiMeteringPointFactoryApi {
        return MeteringPointFactoryImpl(this)
    }

    override fun getPigeonApiSurfaceOrientedMeteringPointFactoryApi(): PigeonApiSurfaceOrientedMeteringPointFactoryApi {
        return SurfaceOrientedMeteringPointFactoryImpl(this)
    }

    override fun getPigeonApiMeteringPointTupleApi(): PigeonApiMeteringPointTupleApi {
        return FocusMeteringActionImpl.MeteringPointTupleImpl(this)
    }

    override fun getPigeonApiDurationTupleApi(): PigeonApiDurationTupleApi {
        return FocusMeteringActionImpl.DurationTupleImpl(this)
    }

    override fun getPigeonApiFocusMeteringActionApi(): PigeonApiFocusMeteringActionApi {
        return FocusMeteringActionImpl(this)
    }

    override fun getPigeonApiFocusMeteringResultApi(): PigeonApiFocusMeteringResultApi {
        return FocusMeteringResultImpl(this)
    }

    override fun getPigeonApiDynamicRangeApi(): PigeonApiDynamicRangeApi {
        return DynamicRangeImpl(this)
    }

    override fun getPigeonApiCameraInfoApi(): PigeonApiCameraInfoApi {
        return CameraInfoImpl(this)
    }

    override fun getPigeonApiCameraControlApi(): PigeonApiCameraControlApi {
        return CameraControlImpl(this)
    }

    override fun getPigeonApiAspectRatioStrategyApi(): PigeonApiAspectRatioStrategyApi {
        return AspectRatioStrategyImpl(this)
    }

    override fun getPigeonApiResolutionFilterApi(): PigeonApiResolutionFilterApi {
        return ResolutionFilterImpl(this)
    }

    override fun getPigeonApiResolutionStrategyApi(): PigeonApiResolutionStrategyApi {
        return ResolutionStrategyImpl(this)
    }

    override fun getPigeonApiResolutionSelectorApi(): PigeonApiResolutionSelectorApi {
        return ResolutionSelectorImpl(this)
    }

    override fun getPigeonApiImageInfoApi(): PigeonApiImageInfoApi {
        return ImageInfoImpl(this)
    }

    override fun getPigeonApiPlaneProxyApi(): PigeonApiPlaneProxyApi {
        return ImageProxyImpl.PlaneProxyImpl(this)
    }

    override fun getPigeonApiImageProxyApi(): PigeonApiImageProxyApi {
        return ImageProxyImpl(this)
    }

    override fun getPigeonApiOnImageCapturedCallbackApi(): PigeonApiOnImageCapturedCallbackApi {
        return ImageCaptureImpl.OnImageCapturedCallbackImpl(this)
    }

    override fun getPigeonApiAnalyzerApi(): PigeonApiAnalyzerApi {
        return ImageAnalysisImpl.AnalyzerImpl(this)
    }

    override fun getPigeonApiImageAnalyzerApi(): PigeonApiImageAnalyzerApi {
        return ImageAnalyzerImpl(this)
    }

    override fun getPigeonApiDetectorApi(): PigeonApiDetectorApi {
        return DetectorImpl(this)
    }

    override fun getPigeonApiAddressApi(): PigeonApiAddressApi {
        return BarcodeImpl.AddressImpl(this)
    }

    override fun getPigeonApiCalendarDateTimeApi(): PigeonApiCalendarDateTimeApi {
        return BarcodeImpl.CalendarDateTimeImpl(this)
    }

    override fun getPigeonApiCalendarEventApi(): PigeonApiCalendarEventApi {
        return BarcodeImpl.CalendarEventImpl(this)
    }

    override fun getPigeonApiContactInfoApi(): PigeonApiContactInfoApi {
        return BarcodeImpl.ContactInfoImpl(this)
    }

    override fun getPigeonApiDriverLicenseApi(): PigeonApiDriverLicenseApi {
        return BarcodeImpl.DriverLicenseImpl(this)
    }

    override fun getPigeonApiEmailApi(): PigeonApiEmailApi {
        return BarcodeImpl.EmailImpl(this)
    }

    override fun getPigeonApiGeoPointApi(): PigeonApiGeoPointApi {
        return BarcodeImpl.GeoPointImpl(this)
    }

    override fun getPigeonApiPersonNameApi(): PigeonApiPersonNameApi {
        return BarcodeImpl.PersonNameImpl(this)
    }

    override fun getPigeonApiPhoneApi(): PigeonApiPhoneApi {
        return BarcodeImpl.PhoneImpl(this)
    }

    override fun getPigeonApiSmsApi(): PigeonApiSmsApi {
        return BarcodeImpl.SmsImpl(this)
    }

    override fun getPigeonApiUrlBookmarkApi(): PigeonApiUrlBookmarkApi {
        return BarcodeImpl.UrlBookmarkImpl(this)
    }

    override fun getPigeonApiWiFiApi(): PigeonApiWiFiApi {
        return BarcodeImpl.WiFiImpl(this)
    }

    override fun getPigeonApiBarcodeApi(): PigeonApiBarcodeApi {
        return BarcodeImpl(this)
    }

    override fun getPigeonApiZoomCallbackApi(): PigeonApiZoomCallbackApi {
        return ZoomSuggestionOptionsImpl.ZoomCallbackImpl(this)
    }

    override fun getPigeonApiZoomSuggestionOptionsApi(): PigeonApiZoomSuggestionOptionsApi {
        return ZoomSuggestionOptionsImpl(this)
    }

    override fun getPigeonApiBarcodeScannerOptionsApi(): PigeonApiBarcodeScannerOptionsApi {
        return BarcodeScannerOptionsImpl(this)
    }

    override fun getPigeonApiBarcodeScannerApi(): PigeonApiBarcodeScannerApi {
        return BarcodeScannerImpl(this)
    }

    override fun getPigeonApiFaceDetectorOptionsApi(): PigeonApiFaceDetectorOptionsApi {
        return FaceDetectorOptionsImpl(this)
    }

    override fun getPigeonApiFaceContourApi(): PigeonApiFaceContourApi {
        return FaceContourImpl(this)
    }

    override fun getPigeonApiFaceLandmarkApi(): PigeonApiFaceLandmarkApi {
        return FaceLandmarkImpl(this)
    }

    override fun getPigeonApiFaceApi(): PigeonApiFaceApi {
        return FaceImpl(this)
    }

    override fun getPigeonApiFaceDetectorApi(): PigeonApiFaceDetectorApi {
        return FaceDetectorImpl(this)
    }

    override fun getPigeonApiMlKitAnalyzerResultApi(): PigeonApiMlKitAnalyzerResultApi {
        return MlKitAnalyzerImpl.ResultImpl(this)
    }

    override fun getPigeonApiMlKitAnalyzerResultConsumerApi(): PigeonApiMlKitAnalyzerResultConsumerApi {
        return MlKitAnalyzerResultConsumerImpl(this)
    }

    override fun getPigeonApiMlKitAnalyzerApi(): PigeonApiMlKitAnalyzerApi {
        return MlKitAnalyzerImpl(this)
    }

    override fun getPigeonApiQualityApi(): PigeonApiQualityApi {
        return QualityImpl(this)
    }

    override fun getPigeonApiFallbackStrategyApi(): PigeonApiFallbackStrategyApi {
        return FallbackStrategyImpl(this)
    }

    override fun getPigeonApiQualitySelectorApi(): PigeonApiQualitySelectorApi {
        return QualitySelectorImpl(this)
    }

    override fun getPigeonApiOutputOptionsApi(): PigeonApiOutputOptionsApi {
        return OutputOptionsImpl(this)
    }

    override fun getPigeonApiFileOutputOptionsApi(): PigeonApiFileOutputOptionsApi {
        return FileOutputOptionsImpl(this)
    }

    override fun getPigeonApiAudioConfigApi(): PigeonApiAudioConfigApi {
        return AudioConfigImpl(this)
    }

    override fun getPigeonApiAudioStatsApi(): PigeonApiAudioStatsApi {
        return AudioStatsImpl(this)
    }

    override fun getPigeonApiRecordingStatsApi(): PigeonApiRecordingStatsApi {
        return RecordingStatsImpl(this)
    }

    override fun getPigeonApiVideoRecordEventApi(): PigeonApiVideoRecordEventApi {
        return VideoRecordEventImpl(this)
    }

    override fun getPigeonApiVideoRecordStatusEventApi(): PigeonApiVideoRecordStatusEventApi {
        return VideoRecordEventImpl.StatusImpl(this)
    }

    override fun getPigeonApiVideoRecordStartEventApi(): PigeonApiVideoRecordStartEventApi {
        return VideoRecordEventImpl.StartImpl(this)
    }

    override fun getPigeonApiVideoRecordPauseEventApi(): PigeonApiVideoRecordPauseEventApi {
        return VideoRecordEventImpl.PauseImpl(this)
    }

    override fun getPigeonApiVideoRecordResumeEventApi(): PigeonApiVideoRecordResumeEventApi {
        return VideoRecordEventImpl.ResumeImpl(this)
    }

    override fun getPigeonApiVideoRecordFinalizeEventApi(): PigeonApiVideoRecordFinalizeEventApi {
        return VideoRecordEventImpl.FinalizeImpl(this)
    }

    override fun getPigeonApiOutputResultsApi(): PigeonApiOutputResultsApi {
        return OutputResultsImpl(this)
    }

    override fun getPigeonApiVideoRecordEventConsumerApi(): PigeonApiVideoRecordEventConsumerApi {
        return VideoRecordEventConsumerImpl(this)
    }

    override fun getPigeonApiRecordingApi(): PigeonApiRecordingApi {
        return RecordingImpl(this)
    }

    override fun getPigeonApiCameraControllerApi(): PigeonApiCameraControllerApi {
        return CameraControllerImpl(this)
    }

    override fun getPigeonApiLifecycleCameraControllerApi(): PigeonApiLifecycleCameraControllerApi {
        return LifecycleCameraControllerImpl(this)
    }

    override fun getPigeonApiPreviewViewApi(): PigeonApiPreviewViewApi {
        return PreviewViewImpl(this)
    }

    @ExperimentalCamera2Interop
    override fun getPigeonApiCamera2CameraControlApi(): PigeonApiCamera2CameraControlApi {
        return Camera2CameraControlImpl(this)
    }

    @ExperimentalCamera2Interop
    override fun getPigeonApiCamera2CameraInfoApi(): PigeonApiCamera2CameraInfoApi {
        return Camera2CameraInfoImpl(this)
    }

    @ExperimentalCamera2Interop
    override fun getPigeonApiCaptureRequestOptionsApi(): PigeonApiCaptureRequestOptionsApi {
        return CaptureRequestOptionsImpl(this)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.binding = binding
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        this.binding = null
    }
}