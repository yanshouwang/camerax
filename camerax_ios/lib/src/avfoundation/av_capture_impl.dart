import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AVCaptureDeviceCinematicVideoFocusModeApiX
    on AVCaptureDeviceCinematicVideoFocusModeApi {
  AVCaptureDeviceCinematicVideoFocusMode get impl =>
      AVCaptureDeviceCinematicVideoFocusMode.values[index];
}
