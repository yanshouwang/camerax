import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ResolutionModeX on ResolutionMode {
  ResolutionModeApi get api {
    switch (this) {
      case ResolutionMode.preferCaptureRateOverHigherResolution:
        return ResolutionModeApi.preferCaptureRateOverHigherResolution;
      case ResolutionMode.preferHigherResolutionOverCaptureRate:
        return ResolutionModeApi.preferHigherResolutionOverCaptureRate;
    }
  }
}

extension ResolutionModeApiX on ResolutionModeApi {
  ResolutionMode get impl {
    switch (this) {
      case ResolutionModeApi.preferCaptureRateOverHigherResolution:
        return ResolutionMode.preferCaptureRateOverHigherResolution;
      case ResolutionModeApi.preferHigherResolutionOverCaptureRate:
        return ResolutionMode.preferHigherResolutionOverCaptureRate;
    }
  }
}
