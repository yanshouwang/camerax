import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension ResolutionModeArgs on $interface.ResolutionMode {
  $native.ResolutionMode get obj {
    switch (this) {
      case $interface.ResolutionMode.preferCaptureRateOverHigherResolution:
        return $native.ResolutionMode.preferCaptureRateOverHigherResolution;
      case $interface.ResolutionMode.preferHigherResolutionOverCaptureRate:
        return $native.ResolutionMode.preferHigherResolutionOverCaptureRate;
    }
  }
}

extension ResolutionModeObj on $native.ResolutionMode {
  $interface.ResolutionMode get args {
    switch (this) {
      case $native.ResolutionMode.preferCaptureRateOverHigherResolution:
        return $interface.ResolutionMode.preferCaptureRateOverHigherResolution;
      case $native.ResolutionMode.preferHigherResolutionOverCaptureRate:
        return $interface.ResolutionMode.preferHigherResolutionOverCaptureRate;
    }
  }
}
