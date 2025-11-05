package dev.zeekr.camerax_android

import android.app.Activity
import android.content.Context
import androidx.camera.camera2.interop.ExperimentalCamera2Interop
import dev.zeekr.camerax_android.camera2.interop.Camera2CameraControlImpl
import dev.zeekr.camerax_android.camera2.interop.Camera2CameraInfoImpl
import dev.zeekr.camerax_android.camera2.interop.CaptureRequestOptionsImpl
import dev.zeekr.camerax_android.common.AutoCloseableImpl
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
import dev.zeekr.camerax_android.common.TorchStateObserverImpl
import dev.zeekr.camerax_android.common.VideoRecordEventConsumerImpl
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
import dev.zeekr.camerax_android.ml.MlKitAnalyzerImpl
import dev.zeekr.camerax_android.ml.barcode.BarcodeImpl
import dev.zeekr.camerax_android.ml.barcode.BarcodeScannerOptionsImpl
import dev.zeekr.camerax_android.ml.barcode.BarcodeScanningImpl
import dev.zeekr.camerax_android.ml.barcode.ZoomSuggestionOptionsImpl
import dev.zeekr.camerax_android.ml.face.FaceContourImpl
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

fun CameraXApiPigeonProxyApiRegistrar.onDetachedFromActivity() =
    impl.onDetachedFromActivity()