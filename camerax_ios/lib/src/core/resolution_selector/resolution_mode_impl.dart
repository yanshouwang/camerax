import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ResolutionModeX on ResolutionSelectorMode {
  ResolutionModeApi get api {
    switch (this) {
      case ResolutionSelectorMode.preferCaptureRateOverHigherResolution:
        return ResolutionModeApi.preferCaptureRateOverHigherResolution;
      case ResolutionSelectorMode.preferHigherResolutionOverCaptureRate:
        return ResolutionModeApi.preferHigherResolutionOverCaptureRate;
    }
  }
}

extension ResolutionModeApiX on ResolutionModeApi {
  ResolutionSelectorMode get impl {
    switch (this) {
      case ResolutionModeApi.preferCaptureRateOverHigherResolution:
        return ResolutionSelectorMode.preferCaptureRateOverHigherResolution;
      case ResolutionModeApi.preferHigherResolutionOverCaptureRate:
        return ResolutionSelectorMode.preferHigherResolutionOverCaptureRate;
    }
  }
}
