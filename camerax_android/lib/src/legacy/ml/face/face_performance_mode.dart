import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension FacePerformanceModeArgs on $base.FacePerformanceMode {
  $native.FacePerformanceMode get obj {
    switch (this) {
      case $base.FacePerformanceMode.fast:
        return $native.FacePerformanceMode.fast;
      case $base.FacePerformanceMode.accurate:
        return $native.FacePerformanceMode.accurate;
    }
  }
}
