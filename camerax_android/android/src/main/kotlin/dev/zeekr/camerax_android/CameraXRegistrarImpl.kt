package dev.zeekr.camerax_android

import android.app.Activity
import android.content.Context
import dev.zeekr.camerax_android.camera2.CameraCaptureSessionImpl
import dev.zeekr.camerax_android.camera2.CameraCharacteristicsImpl
import dev.zeekr.camerax_android.camera2.CameraMetadataUtilImpl
import dev.zeekr.camerax_android.camera2.CaptureFailureImpl
import dev.zeekr.camerax_android.camera2.CaptureRequestImpl
import dev.zeekr.camerax_android.camera2.CaptureResultImpl
import dev.zeekr.camerax_android.camera2.TotalCaptureResultImpl
import dev.zeekr.camerax_android.camera2.interop.Camera2CameraControlImpl
import dev.zeekr.camerax_android.camera2.interop.Camera2CameraInfoImpl
import dev.zeekr.camerax_android.camera2.interop.Camera2InteropImpl
import dev.zeekr.camerax_android.camera2.interop.CaptureRequestOptionsImpl
import dev.zeekr.camerax_android.common.AutoCloseableImpl
import dev.zeekr.camerax_android.common.BitmapImpl
import dev.zeekr.camerax_android.common.CameraStateObserverImpl
import dev.zeekr.camerax_android.common.ImageProxyConsumerImpl
import dev.zeekr.camerax_android.common.IntObserverImpl
import dev.zeekr.camerax_android.common.IntRangeImpl
import dev.zeekr.camerax_android.common.LocationImpl
import dev.zeekr.camerax_android.common.LongRangeImpl
import dev.zeekr.camerax_android.common.LowLightBoostStateObserverImpl
import dev.zeekr.camerax_android.common.MlKitAnalyzerResultConsumerImpl
import dev.zeekr.camerax_android.common.PermissionManagerImpl
import dev.zeekr.camerax_android.common.PointFImpl
import dev.zeekr.camerax_android.common.PointImpl
import dev.zeekr.camerax_android.common.PreviewViewStreamStateObserverImpl
import dev.zeekr.camerax_android.common.RectImpl
import dev.zeekr.camerax_android.common.SizeImpl
import dev.zeekr.camerax_android.common.TapToFocusInfoObserverImpl
import dev.zeekr.camerax_android.common.TorchStateObserverImpl
import dev.zeekr.camerax_android.common.VideoRecordEventConsumerImpl
import dev.zeekr.camerax_android.common.ZoomStateObserverImpl
import dev.zeekr.camerax_android.core.BufferImpl
import dev.zeekr.camerax_android.core.ByteArrayOutputStreamImpl
import dev.zeekr.camerax_android.core.ByteBufferImpl
import dev.zeekr.camerax_android.core.CameraControlImpl
import dev.zeekr.camerax_android.core.CameraFilterImpl
import dev.zeekr.camerax_android.core.CameraInfoImpl
import dev.zeekr.camerax_android.core.CameraSelectorImpl
import dev.zeekr.camerax_android.core.DynamicRangeImpl
import dev.zeekr.camerax_android.core.ExposureStateImpl
import dev.zeekr.camerax_android.core.FocusMeteringActionImpl
import dev.zeekr.camerax_android.core.FocusMeteringResultImpl
import dev.zeekr.camerax_android.core.ImageAnalysisImpl
import dev.zeekr.camerax_android.core.ImageCaptureImpl
import dev.zeekr.camerax_android.core.ImageInfoImpl
import dev.zeekr.camerax_android.core.ImageProxyImpl
import dev.zeekr.camerax_android.core.MeteringPointFactoryImpl
import dev.zeekr.camerax_android.core.MeteringPointImpl
import dev.zeekr.camerax_android.core.NullOutputStreamImpl
import dev.zeekr.camerax_android.core.OutputStreamImpl
import dev.zeekr.camerax_android.core.SurfaceOrientedMeteringPointFactoryImpl
import dev.zeekr.camerax_android.core.ZoomStateImpl
import dev.zeekr.camerax_android.core.resolutionselector.AspectRatioStrategyImpl
import dev.zeekr.camerax_android.core.resolutionselector.ResolutionFilterImpl
import dev.zeekr.camerax_android.core.resolutionselector.ResolutionSelectorImpl
import dev.zeekr.camerax_android.core.resolutionselector.ResolutionStrategyImpl
import dev.zeekr.camerax_android.ml.MlKitAnalyzerImpl
import dev.zeekr.camerax_android.ml.barcode.BarcodeImpl
import dev.zeekr.camerax_android.ml.barcode.BarcodeScannerImpl
import dev.zeekr.camerax_android.ml.barcode.BarcodeScannerOptionsImpl
import dev.zeekr.camerax_android.ml.barcode.ZoomSuggestionOptionsImpl
import dev.zeekr.camerax_android.ml.common.InputImageImpl
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
import dev.zeekr.camerax_android.view.RotationProviderImpl
import dev.zeekr.camerax_android.view.TapToFocusInfoImpl
import dev.zeekr.camerax_android.view.video.AudioConfigImpl
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger

class CameraXRegistrarImpl(binaryMessenger: BinaryMessenger, val context: Context) :
    CameraXApiPigeonProxyApiRegistrar(binaryMessenger), ActivityAware {
    var binding: ActivityPluginBinding? = null

    val activity: Activity get() = binding?.activity ?: throw NullPointerException("binding is null")

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

    override fun getPigeonApiCamera2CameraControlProxyApi(): PigeonApiCamera2CameraControlProxyApi {
        return Camera2CameraControlImpl(this)
    }

    override fun getPigeonApiCamera2CameraInfoProxyApi(): PigeonApiCamera2CameraInfoProxyApi {
        return Camera2CameraInfoImpl(this)
    }

    override fun getPigeonApiCamera2InteropExtenderProxyApi(): PigeonApiCamera2InteropExtenderProxyApi {
        return Camera2InteropImpl.ExtenderImpl(this)
    }

    override fun getPigeonApiCaptureRequestOptionsBuilderProxyApi(): PigeonApiCaptureRequestOptionsBuilderProxyApi {
        return CaptureRequestOptionsImpl.BuilderImpl(this)
    }

    override fun getPigeonApiCaptureRequestOptionsProxyApi(): PigeonApiCaptureRequestOptionsProxyApi {
        return CaptureRequestOptionsImpl(this)
    }

    override fun getPigeonApiCameraCaptureSessionCaptureCallbackProxyApi(): PigeonApiCameraCaptureSessionCaptureCallbackProxyApi {
        return CameraCaptureSessionImpl.CaptureCallbackImpl(this)
    }

    override fun getPigeonApiCameraCaptureSessionStateCallbackProxyApi(): PigeonApiCameraCaptureSessionStateCallbackProxyApi {
        return CameraCaptureSessionImpl.StateCallbackImpl(this)
    }

    override fun getPigeonApiCameraCharacteristicsKeyProxyApi(): PigeonApiCameraCharacteristicsKeyProxyApi {
        return CameraCharacteristicsImpl.KeyImpl(this)
    }

    override fun getPigeonApiCameraCharacteristicsProxyApi(): PigeonApiCameraCharacteristicsProxyApi {
        return CameraCharacteristicsImpl(this)
    }

    override fun getPigeonApiCameraMetadataUtilProxyApi(): PigeonApiCameraMetadataUtilProxyApi {
        return CameraMetadataUtilImpl(this)
    }

    override fun getPigeonApiCaptureFailureProxyApi(): PigeonApiCaptureFailureProxyApi {
        return CaptureFailureImpl(this)
    }

    override fun getPigeonApiCaptureRequestKeyProxyApi(): PigeonApiCaptureRequestKeyProxyApi {
        return CaptureRequestImpl.KeyImpl(this)
    }

    override fun getPigeonApiCaptureRequestProxyApi(): PigeonApiCaptureRequestProxyApi {
        return CaptureRequestImpl(this)
    }

    override fun getPigeonApiCaptureResultKeyProxyApi(): PigeonApiCaptureResultKeyProxyApi {
        return CaptureResultImpl.KeyImpl(this)
    }

    override fun getPigeonApiCaptureResultProxyApi(): PigeonApiCaptureResultProxyApi {
        return CaptureResultImpl(this)
    }

    override fun getPigeonApiTotalCaptureResultProxyApi(): PigeonApiTotalCaptureResultProxyApi {
        return TotalCaptureResultImpl(this)
    }

    override fun getPigeonApiAutoCloseableProxyApi(): PigeonApiAutoCloseableProxyApi {
        return AutoCloseableImpl(this)
    }

    override fun getPigeonApiBitmapProxyApi(): PigeonApiBitmapProxyApi {
        return BitmapImpl(this)
    }

    override fun getPigeonApiBufferProxyApi(): PigeonApiBufferProxyApi {
        return BufferImpl(this)
    }

    override fun getPigeonApiByteBufferProxyApi(): PigeonApiByteBufferProxyApi {
        return ByteBufferImpl(this)
    }

    override fun getPigeonApiOutputStreamProxyApi(): PigeonApiOutputStreamProxyApi {
        return OutputStreamImpl(this)
    }

    override fun getPigeonApiNullOutputStreamProxyApi(): PigeonApiNullOutputStreamProxyApi {
        return NullOutputStreamImpl(this)
    }

    override fun getPigeonApiByteArrayOutputStreamProxyApi(): PigeonApiByteArrayOutputStreamProxyApi {
        return ByteArrayOutputStreamImpl(this)
    }

    override fun getPigeonApiImageProxyConsumerProxyApi(): PigeonApiImageProxyConsumerProxyApi {
        return ImageProxyConsumerImpl(this)
    }

    override fun getPigeonApiMlKitAnalyzerResultConsumerProxyApi(): PigeonApiMlKitAnalyzerResultConsumerProxyApi {
        return MlKitAnalyzerResultConsumerImpl(this)
    }

    override fun getPigeonApiVideoRecordEventConsumerProxyApi(): PigeonApiVideoRecordEventConsumerProxyApi {
        return VideoRecordEventConsumerImpl(this)
    }

    override fun getPigeonApiLocationProxyApi(): PigeonApiLocationProxyApi {
        return LocationImpl(this)
    }

    override fun getPigeonApiCameraStateObserverProxyApi(): PigeonApiCameraStateObserverProxyApi {
        return CameraStateObserverImpl(this)
    }

    override fun getPigeonApiIntObserverProxyApi(): PigeonApiIntObserverProxyApi {
        return IntObserverImpl(this)
    }

    override fun getPigeonApiLowLightBoostStateObserverProxyApi(): PigeonApiLowLightBoostStateObserverProxyApi {
        return LowLightBoostStateObserverImpl(this)
    }

    override fun getPigeonApiPreviewViewStreamStateObserverProxyApi(): PigeonApiPreviewViewStreamStateObserverProxyApi {
        return PreviewViewStreamStateObserverImpl(this)
    }

    override fun getPigeonApiTapToFocusInfoObserverProxyApi(): PigeonApiTapToFocusInfoObserverProxyApi {
        return TapToFocusInfoObserverImpl(this)
    }

    override fun getPigeonApiTorchStateObserverProxyApi(): PigeonApiTorchStateObserverProxyApi {
        return TorchStateObserverImpl(this)
    }

    override fun getPigeonApiZoomStateObserverProxyApi(): PigeonApiZoomStateObserverProxyApi {
        return ZoomStateObserverImpl(this)
    }

    override fun getPigeonApiPermissionManagerProxyApi(): PigeonApiPermissionManagerProxyApi {
        return PermissionManagerImpl(this)
    }

    override fun getPigeonApiPointProxyApi(): PigeonApiPointProxyApi {
        return PointImpl(this)
    }

    override fun getPigeonApiPointFProxyApi(): PigeonApiPointFProxyApi {
        return PointFImpl(this)
    }

    override fun getPigeonApiRectProxyApi(): PigeonApiRectProxyApi {
        return RectImpl(this)
    }

    override fun getPigeonApiSizeProxyApi(): PigeonApiSizeProxyApi {
        return SizeImpl(this)
    }

    override fun getPigeonApiIntRangeProxyApi(): PigeonApiIntRangeProxyApi {
        return IntRangeImpl(this)
    }

    override fun getPigeonApiLongRangeProxyApi(): PigeonApiLongRangeProxyApi {
        return LongRangeImpl(this)
    }

    override fun getPigeonApiAspectRatioStrategyProxyApi(): PigeonApiAspectRatioStrategyProxyApi {
        return AspectRatioStrategyImpl(this)
    }

    override fun getPigeonApiResolutionFilterProxyApi(): PigeonApiResolutionFilterProxyApi {
        return ResolutionFilterImpl(this)
    }

    override fun getPigeonApiResolutionStrategyProxyApi(): PigeonApiResolutionStrategyProxyApi {
        return ResolutionStrategyImpl(this)
    }

    override fun getPigeonApiResolutionSelectorBuilderProxyApi(): PigeonApiResolutionSelectorBuilderProxyApi {
        return ResolutionSelectorImpl.BuilderImpl(this)
    }

    override fun getPigeonApiResolutionSelectorProxyApi(): PigeonApiResolutionSelectorProxyApi {
        return ResolutionSelectorImpl(this)
    }

    override fun getPigeonApiCameraControlProxyApi(): PigeonApiCameraControlProxyApi {
        return CameraControlImpl(this)
    }

    override fun getPigeonApiCameraFilterProxyApi(): PigeonApiCameraFilterProxyApi {
        return CameraFilterImpl(this)
    }

    override fun getPigeonApiCameraInfoProxyApi(): PigeonApiCameraInfoProxyApi {
        return CameraInfoImpl(this)
    }

    override fun getPigeonApiCameraSelectorBuilderProxyApi(): PigeonApiCameraSelectorBuilderProxyApi {
        return CameraSelectorImpl.BuilderImpl(this)
    }

    override fun getPigeonApiCameraSelectorProxyApi(): PigeonApiCameraSelectorProxyApi {
        return CameraSelectorImpl(this)
    }

    override fun getPigeonApiDynamicRangeProxyApi(): PigeonApiDynamicRangeProxyApi {
        return DynamicRangeImpl(this)
    }

    override fun getPigeonApiExposureStateProxyApi(): PigeonApiExposureStateProxyApi {
        return ExposureStateImpl(this)
    }

    override fun getPigeonApiFocusMeteringActionBuilderProxyApi(): PigeonApiFocusMeteringActionBuilderProxyApi {
        return FocusMeteringActionImpl.BuilderImpl(this)
    }

    override fun getPigeonApiFocusMeteringActionProxyApi(): PigeonApiFocusMeteringActionProxyApi {
        return FocusMeteringActionImpl(this)
    }

    override fun getPigeonApiFocusMeteringResultProxyApi(): PigeonApiFocusMeteringResultProxyApi {
        return FocusMeteringResultImpl(this)
    }

    override fun getPigeonApiImageAnalysisAnalyzerProxyApi(): PigeonApiImageAnalysisAnalyzerProxyApi {
        return ImageAnalysisImpl.AnalyzerImpl(this)
    }

    override fun getPigeonApiImageAnalysisAnalyzerImplProxyApi(): PigeonApiImageAnalysisAnalyzerImplProxyApi {
        return ImageAnalysisImpl.AnalyzerImplImpl(this)
    }

    override fun getPigeonApiImageCaptureOnImageCapturedCallbackProxyApi(): PigeonApiImageCaptureOnImageCapturedCallbackProxyApi {
        return ImageCaptureImpl.OnImageCapturedCallbackImpl(this)
    }

    override fun getPigeonApiImageInfoProxyApi(): PigeonApiImageInfoProxyApi {
        return ImageInfoImpl(this)
    }

    override fun getPigeonApiImageProxyPlaneProxyProxyApi(): PigeonApiImageProxyPlaneProxyProxyApi {
        return ImageProxyImpl.PlaneProxyImpl(this)
    }

    override fun getPigeonApiImageProxyProxyApi(): PigeonApiImageProxyProxyApi {
        return ImageProxyImpl(this)
    }

    override fun getPigeonApiMeteringPointProxyApi(): PigeonApiMeteringPointProxyApi {
        return MeteringPointImpl(this)
    }

    override fun getPigeonApiMeteringPointFactoryProxyApi(): PigeonApiMeteringPointFactoryProxyApi {
        return MeteringPointFactoryImpl(this)
    }

    override fun getPigeonApiSurfaceOrientedMeteringPointFactoryProxyApi(): PigeonApiSurfaceOrientedMeteringPointFactoryProxyApi {
        return SurfaceOrientedMeteringPointFactoryImpl(this)
    }

    override fun getPigeonApiZoomStateProxyApi(): PigeonApiZoomStateProxyApi {
        return ZoomStateImpl(this)
    }

    override fun getPigeonApiBarcodeAddressProxyApi(): PigeonApiBarcodeAddressProxyApi {
        return BarcodeImpl.AddressImpl(this)
    }

    override fun getPigeonApiBarcodeCalendarDateTimeProxyApi(): PigeonApiBarcodeCalendarDateTimeProxyApi {
        return BarcodeImpl.CalendarDateTimeImpl(this)
    }

    override fun getPigeonApiBarcodeCalendarEventProxyApi(): PigeonApiBarcodeCalendarEventProxyApi {
        return BarcodeImpl.CalendarEventImpl(this)
    }

    override fun getPigeonApiBarcodeContactInfoProxyApi(): PigeonApiBarcodeContactInfoProxyApi {
        return BarcodeImpl.ContactInfoImpl(this)
    }

    override fun getPigeonApiBarcodeDriverLicenseProxyApi(): PigeonApiBarcodeDriverLicenseProxyApi {
        return BarcodeImpl.DriverLicenseImpl(this)
    }

    override fun getPigeonApiBarcodeEmailProxyApi(): PigeonApiBarcodeEmailProxyApi {
        return BarcodeImpl.EmailImpl(this)
    }

    override fun getPigeonApiBarcodeGeoPointProxyApi(): PigeonApiBarcodeGeoPointProxyApi {
        return BarcodeImpl.GeoPointImpl(this)
    }

    override fun getPigeonApiBarcodePersonNameProxyApi(): PigeonApiBarcodePersonNameProxyApi {
        return BarcodeImpl.PersonNameImpl(this)
    }

    override fun getPigeonApiBarcodePhoneProxyApi(): PigeonApiBarcodePhoneProxyApi {
        return BarcodeImpl.PhoneImpl(this)
    }

    override fun getPigeonApiBarcodeSmsProxyApi(): PigeonApiBarcodeSmsProxyApi {
        return BarcodeImpl.SmsImpl(this)
    }

    override fun getPigeonApiBarcodeUrlBookmarkProxyApi(): PigeonApiBarcodeUrlBookmarkProxyApi {
        return BarcodeImpl.UrlBookmarkImpl(this)
    }

    override fun getPigeonApiBarcodeWiFiProxyApi(): PigeonApiBarcodeWiFiProxyApi {
        return BarcodeImpl.WiFiImpl(this)
    }

    override fun getPigeonApiBarcodeProxyApi(): PigeonApiBarcodeProxyApi {
        return BarcodeImpl(this)
    }

    override fun getPigeonApiInputImageProxyApi(): PigeonApiInputImageProxyApi {
        return InputImageImpl(this)
    }

    override fun getPigeonApiZoomSuggestionOptionsZoomCallbackProxyApi(): PigeonApiZoomSuggestionOptionsZoomCallbackProxyApi {
        return ZoomSuggestionOptionsImpl.ZoomCallbackImpl(this)
    }

    override fun getPigeonApiZoomSuggestionOptionsBuilderProxyApi(): PigeonApiZoomSuggestionOptionsBuilderProxyApi {
        return ZoomSuggestionOptionsImpl.BuilderImpl(this)
    }

    override fun getPigeonApiBarcodeScannerOptionsBuilderProxyApi(): PigeonApiBarcodeScannerOptionsBuilderProxyApi {
        return BarcodeScannerOptionsImpl.BuilderImpl(this)
    }

    override fun getPigeonApiBarcodeScannerOptionsProxyApi(): PigeonApiBarcodeScannerOptionsProxyApi {
        return BarcodeScannerOptionsImpl(this)
    }

    override fun getPigeonApiBarcodeScannerProxyApi(): PigeonApiBarcodeScannerProxyApi {
        return BarcodeScannerImpl(this)
    }

    override fun getPigeonApiFaceContourProxyApi(): PigeonApiFaceContourProxyApi {
        return FaceContourImpl(this)
    }

    override fun getPigeonApiFaceLandmarkProxyApi(): PigeonApiFaceLandmarkProxyApi {
        return FaceLandmarkImpl(this)
    }

    override fun getPigeonApiFaceProxyApi(): PigeonApiFaceProxyApi {
        return FaceImpl(this)
    }

    override fun getPigeonApiFaceDetectorOptionsBuilderProxyApi(): PigeonApiFaceDetectorOptionsBuilderProxyApi {
        return FaceDetectorOptionsImpl.BuilderImpl(this)
    }

    override fun getPigeonApiFaceDetectorOptionsProxyApi(): PigeonApiFaceDetectorOptionsProxyApi {
        return FaceDetectorOptionsImpl(this)
    }

    override fun getPigeonApiFaceDetectorProxyApi(): PigeonApiFaceDetectorProxyApi {
        return FaceDetectorImpl(this)
    }

    override fun getPigeonApiMlKitAnalyzerResultProxyApi(): PigeonApiMlKitAnalyzerResultProxyApi {
        return MlKitAnalyzerImpl.ResultImpl(this)
    }

    override fun getPigeonApiMlKitAnalyzerProxyApi(): PigeonApiMlKitAnalyzerProxyApi {
        return MlKitAnalyzerImpl(this)
    }

    override fun getPigeonApiAudioStatsProxyApi(): PigeonApiAudioStatsProxyApi {
        return AudioStatsImpl(this)
    }

    override fun getPigeonApiFallbackStrategyProxyApi(): PigeonApiFallbackStrategyProxyApi {
        return FallbackStrategyImpl(this)
    }

    override fun getPigeonApiOutputOptionsProxyApi(): PigeonApiOutputOptionsProxyApi {
        return OutputOptionsImpl(this)
    }

    override fun getPigeonApiFileOutputOptionsBuilderProxyApi(): PigeonApiFileOutputOptionsBuilderProxyApi {
        return FileOutputOptionsImpl.BuilderImpl(this)
    }

    override fun getPigeonApiFileOutputOptionsProxyApi(): PigeonApiFileOutputOptionsProxyApi {
        return FileOutputOptionsImpl(this)
    }

    override fun getPigeonApiOutputResultsProxyApi(): PigeonApiOutputResultsProxyApi {
        return OutputResultsImpl(this)
    }

    override fun getPigeonApiQualityProxyApi(): PigeonApiQualityProxyApi {
        return QualityImpl(this)
    }

    override fun getPigeonApiQualitySelectorProxyApi(): PigeonApiQualitySelectorProxyApi {
        return QualitySelectorImpl(this)
    }

    override fun getPigeonApiRecordingStatsProxyApi(): PigeonApiRecordingStatsProxyApi {
        return RecordingStatsImpl(this)
    }

    override fun getPigeonApiRecordingProxyApi(): PigeonApiRecordingProxyApi {
        return RecordingImpl(this)
    }

    override fun getPigeonApiVideoRecordEventStatusProxyApi(): PigeonApiVideoRecordEventStatusProxyApi {
        return VideoRecordEventImpl.StatusImpl(this)
    }

    override fun getPigeonApiVideoRecordEventStartProxyApi(): PigeonApiVideoRecordEventStartProxyApi {
        return VideoRecordEventImpl.StartImpl(this)
    }

    override fun getPigeonApiVideoRecordEventPauseProxyApi(): PigeonApiVideoRecordEventPauseProxyApi {
        return VideoRecordEventImpl.PauseImpl(this)
    }

    override fun getPigeonApiVideoRecordEventResumeProxyApi(): PigeonApiVideoRecordEventResumeProxyApi {
        return VideoRecordEventImpl.ResumeImpl(this)
    }

    override fun getPigeonApiVideoRecordEventFinalizeProxyApi(): PigeonApiVideoRecordEventFinalizeProxyApi {
        return VideoRecordEventImpl.FinalizeImpl(this)
    }

    override fun getPigeonApiAudioConfigProxyApi(): PigeonApiAudioConfigProxyApi {
        return AudioConfigImpl(this)
    }

    override fun getPigeonApiCameraControllerProxyApi(): PigeonApiCameraControllerProxyApi {
        return CameraControllerImpl(this)
    }

    override fun getPigeonApiLifecycleCameraControllerProxyApi(): PigeonApiLifecycleCameraControllerProxyApi {
        return LifecycleCameraControllerImpl(this)
    }

    override fun getPigeonApiPreviewViewProxyApi(): PigeonApiPreviewViewProxyApi {
        return PreviewViewImpl(this)
    }

    override fun getPigeonApiRotationProviderListenerProxyApi(): PigeonApiRotationProviderListenerProxyApi {
        return RotationProviderImpl.ListenerImpl(this)
    }

    override fun getPigeonApiRotationProviderProxyApi(): PigeonApiRotationProviderProxyApi {
        return RotationProviderImpl(this)
    }

    override fun getPigeonApiTapToFocusInfoProxyApi(): PigeonApiTapToFocusInfoProxyApi {
        return TapToFocusInfoImpl(this)
    }
}

val CameraXApiPigeonProxyApiRegistrar.impl: CameraXRegistrarImpl
    get() {
        val impl = this
        if (impl !is CameraXRegistrarImpl) throw TypeCastException("impl is not CameraXRegistrarImpl")
        return impl
    }

val CameraXApiPigeonProxyApiRegistrar.context: Context get() = impl.context

val CameraXApiPigeonProxyApiRegistrar.activity: Activity get() = impl.activity

fun CameraXApiPigeonProxyApiRegistrar.onAttachedToActivity(binding: ActivityPluginBinding) =
    impl.onAttachedToActivity(binding)

fun CameraXApiPigeonProxyApiRegistrar.onDetachedFromActivityForConfigChanges() =
    impl.onDetachedFromActivityForConfigChanges()

fun CameraXApiPigeonProxyApiRegistrar.onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) =
    impl.onReattachedToActivityForConfigChanges(binding)

fun CameraXApiPigeonProxyApiRegistrar.onDetachedFromActivity() = impl.onDetachedFromActivity()