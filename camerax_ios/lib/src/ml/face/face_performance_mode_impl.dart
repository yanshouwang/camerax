import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension FacePerformanceModeX on FacePerformanceMode {
  FacePerformanceModeApi get api {
    switch (this) {
      case FacePerformanceMode.fast:
        return FacePerformanceModeApi.fast;
      case FacePerformanceMode.accurate:
        return FacePerformanceModeApi.accurate;
    }
  }
}
