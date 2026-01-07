import 'package:camerax_ios/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AVCaptureDeviceCinematicVideoFocusModeApiX
    on AVCaptureDeviceCinematicVideoFocusModeApi {
  AVCaptureDeviceCinematicVideoFocusMode get impl =>
      AVCaptureDeviceCinematicVideoFocusMode.values[index];
}
