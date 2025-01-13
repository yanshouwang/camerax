import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension FaceLandmarkModeArgs on $base.FaceLandmarkMode {
  $native.FaceLandmarkMode get obj {
    switch (this) {
      case $base.FaceLandmarkMode.none:
        return $native.FaceLandmarkMode.none;
      case $base.FaceLandmarkMode.all:
        return $native.FaceLandmarkMode.all;
    }
  }
}
