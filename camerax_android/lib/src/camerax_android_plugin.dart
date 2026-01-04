import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera2.dart';
import 'common.dart';
import 'core.dart';
import 'ml.dart';
import 'video.dart';
import 'view.dart';
import 'visionx.dart';

abstract final class CameraXAndroidPlugin {
  static void registerWith() {
    // camera2.interop
    Camera2CameraControlChannel.instance = Camera2CameraControlChannelImpl();
    Camera2CameraInfoChannel.instance = Camera2CameraInfoChannelImpl();
    Camera2InteropChannel.instance = Camera2InteropChannelImpl();
    CaptureRequestOptionsChannel.instance = CaptureRequestOptionsChannelImpl();
    // camera2
    CameraCaptureSessionChannel.instance = CameraCaptureSessionChannelImpl();
    CameraCharacteristicsChannel.instance = CameraCharacteristicsChannelImpl();
    CaptureRequestChannel.instance = CaptureRequestChannelImpl();
    CaptureResultChannel.instance = CaptureResultChannelImpl();
    // common
    ConsumerChannel.instance = ConsumerChannelImpl();
    LocationChannel.instance = LocationChannelImpl();
    ObserverChannel.instance = ObserverChannelImpl();
    PermissionManagerChannel.instance = PermissionManagerChannelImpl();
    // core.resolution_selector
    AspectRatioStrategyChannel.instance = AspectRatioStrategyChannelImpl();
    ResolutionFilterChannel.instance = ResolutionFilterChannelImpl();
    ResolutionSelectorChannel.instance = ResolutionSelectorChannelImpl();
    ResolutionStrategyChannel.instance = ResolutionStrategyChannelImpl();
    // core
    CameraInfoChannel.instance = CameraInfoChannelImpl();
    CameraSelectorChannel.instance = CameraSelectorChannelImpl();
    DynamicRangeChannel.instance = DynamicRangeChannelImpl();
    FocusMeteringActionChannel.instance = FocusMeteringActionChannelImpl();
    ImageAnalysisChannel.instance = ImageAnalysisChannelImpl();
    ImageCaptureChannel.instance = ImageCaptureChannelImpl();
    MeteringPointFactoryChannel.instance = MeteringPointFactoryChannelImpl();
    SurfaceOrientedMeteringPointFactoryChannel.instance =
        SurfaceOrientedMeteringPointFactoryChannelImpl();
    // ml.barcode
    BarcodeScannerOptionsChannel.instance = BarcodeScannerOptionsChannelImpl();
    BarcodeScannerChannel.instance = BarcodeScannerChannelImpl();
    ZoomSuggestionOptionsChannel.instance = ZoomSuggestionOptionsChannelImpl();
    // ml.common
    InputImageChannel.instance = InputImageChannelImpl();
    // ml.face
    FaceDetectorOptionsChannel.instance = FaceDetectorOptionsChannelImpl();
    FaceDetectorChannel.instance = FaceDetectorChannelImpl();
    // ml
    MlKitAnalyzerChannel.instance = MlKitAnalyzerChannelImpl();
    // video
    FallbackStrategyChannel.instance = FallbackStrategyChannelImpl();
    FileOutputOptionsChannel.instance = FileOutputOptionsChannelImpl();
    QualityChannel.instance = QualityChannelImpl();
    QualitySelectorChannel.instance = QualitySelectorChannelImpl();
    // view
    AudioConfigChannel.instance = AudioConfigChannelImpl();
    CameraControllerChannel.instance = CameraControllerChannelImpl();
    PreviewViewChannel.instance = PreviewViewChannelImpl();
    RotationProviderChannel.instance = RotationProviderChannelImpl();
    // visionx
    VisionAnalyzerChannel.instance = VisionAnalyzerChannelImpl();
    VisionDetectorChannel.instance = VisionDetectorChannelImpl();
    VisionImageChannel.instance = VisionImageChannelImpl();
  }
}
