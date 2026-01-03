import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'avfoundation.dart';
import 'common.dart';
import 'core.dart';
import 'video.dart';
import 'view.dart';
import 'vision.dart';
import 'visionx.dart';

abstract final class CameraXiOSPlugin {
  static void registerWith() {
    // avfoundation
    AVAnalyzerChannel.instance = AVAnalyzerChannelImpl();
    // common
    ConsumerChannel.instance = ConsumerChannelImpl();
    LocationChannel.instance = LocationChannelImpl();
    ObserverChannel.instance = ObserverChannelImpl();
    PermissionManagerChannel.instance = PermissionManagerChannelImpl();
    // core.resolution_selector
    // AspectRatioStrategyChannel.instance = AspectRatioStrategyChannelImpl();
    // ResolutionFilterChannel.instance = ResolutionFilterChannelImpl();
    ResolutionSelectorChannel.instance = ResolutionSelectorChannelImpl();
    ResolutionStrategyChannel.instance = ResolutionStrategyChannelImpl();
    // core
    CameraInfoChannel.instance = CameraInfoChannelImpl();
    CameraSelectorChannel.instance = CameraSelectorChannelImpl();
    // DynamicRangeChannel.instance = DynamicRangeChannelImpl();
    FocusMeteringActionChannel.instance = FocusMeteringActionChannelImpl();
    ImageAnalysisChannel.instance = ImageAnalysisChannelImpl();
    ImageCaptureChannel.instance = ImageCaptureChannelImpl();
    MeteringPointFactoryChannel.instance = MeteringPointFactoryChannelImpl();
    SurfaceOrientedMeteringPointFactoryChannel.instance =
        SurfaceOrientedMeteringPointFactoryChannelImpl();
    // video
    // FallbackStrategyChannel.instance = FallbackStrategyChannelImpl();
    FileOutputOptionsChannel.instance = FileOutputOptionsChannelImpl();
    // QualityChannel.instance = QualityChannelImpl();
    // QualitySelectorChannel.instance = QualitySelectorChannelImpl();
    // view
    AudioConfigChannel.instance = AudioConfigChannelImpl();
    CameraControllerChannel.instance = CameraControllerChannelImpl();
    PreviewViewChannel.instance = PreviewViewChannelImpl();
    RotationProviderChannel.instance = RotationProviderChannelImpl();
    // vision
    VNImageRequestHandlerChannel.instance = VNImageRequestHandlerChannelImpl();
    VNDetectBarcodesRequestChannel.instance =
        VNDetectBarcodesRequestChannelImpl();
    VNDetectFaceRectanglesRequestChannel.instance =
        VNDetectFaceRectanglesRequestChannelImpl();
    // visionx
    VisionAnalyzerChannel.instance = VisionAnalyzerChannelImpl();
    VisionDetectorChannel.instance = VisionDetectorChannelImpl();
    VisionImageChannel.instance = VisionImageChannelImpl();
  }
}
