import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension CaptureModeX on CaptureMode {
  CaptureModeApi get api {
    switch (this) {
      case CaptureMode.maximizeQuality:
        return CaptureModeApi.maximizeQuality;
      case CaptureMode.minimizeLatency:
        return CaptureModeApi.minimizeLatency;
      case CaptureMode.zeroShutterLag:
        return CaptureModeApi.zeroShutterLag;
    }
  }
}

extension CaptureModeApiX on CaptureModeApi {
  CaptureMode get impl {
    switch (this) {
      case CaptureModeApi.maximizeQuality:
        return CaptureMode.maximizeQuality;
      case CaptureModeApi.minimizeLatency:
        return CaptureMode.minimizeLatency;
      case CaptureModeApi.zeroShutterLag:
        return CaptureMode.zeroShutterLag;
    }
  }
}
