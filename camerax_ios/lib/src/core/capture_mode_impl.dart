import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension CaptureModeX on ImageCaptureCaptureMode {
  CaptureModeApi get api {
    switch (this) {
      case ImageCaptureCaptureMode.maximizeQuality:
        return CaptureModeApi.maximizeQuality;
      case ImageCaptureCaptureMode.minimizeLatency:
        return CaptureModeApi.minimizeLatency;
      case ImageCaptureCaptureMode.zeroShutterLag:
        return CaptureModeApi.zeroShutterLag;
    }
  }
}

extension CaptureModeApiX on CaptureModeApi {
  ImageCaptureCaptureMode get impl {
    switch (this) {
      case CaptureModeApi.maximizeQuality:
        return ImageCaptureCaptureMode.maximizeQuality;
      case CaptureModeApi.minimizeLatency:
        return ImageCaptureCaptureMode.minimizeLatency;
      case CaptureModeApi.zeroShutterLag:
        return ImageCaptureCaptureMode.zeroShutterLag;
    }
  }
}
