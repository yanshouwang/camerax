import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension ResolutionModeArgs on $base.ResolutionMode {
  $native.ResolutionMode get obj {
    switch (this) {
      case $base.ResolutionMode.preferCaptureRateOverHigherResolution:
        return $native.ResolutionMode.preferCaptureRateOverHigherResolution;
      case $base.ResolutionMode.preferHigherResolutionOverCaptureRate:
        return $native.ResolutionMode.preferHigherResolutionOverCaptureRate;
    }
  }
}

extension ResolutionModeObj on $native.ResolutionMode {
  $base.ResolutionMode get args {
    switch (this) {
      case $native.ResolutionMode.preferCaptureRateOverHigherResolution:
        return $base.ResolutionMode.preferCaptureRateOverHigherResolution;
      case $native.ResolutionMode.preferHigherResolutionOverCaptureRate:
        return $base.ResolutionMode.preferHigherResolutionOverCaptureRate;
    }
  }
}
