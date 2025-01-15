import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension FacePerformanceModeArgs on $interface.FacePerformanceMode {
  $native.FacePerformanceMode get obj {
    switch (this) {
      case $interface.FacePerformanceMode.fast:
        return $native.FacePerformanceMode.fast;
      case $interface.FacePerformanceMode.accurate:
        return $native.FacePerformanceMode.accurate;
    }
  }
}
