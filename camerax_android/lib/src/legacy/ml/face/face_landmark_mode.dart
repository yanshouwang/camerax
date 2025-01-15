import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension FaceLandmarkModeArgs on $interface.FaceLandmarkMode {
  $native.FaceLandmarkMode get obj {
    switch (this) {
      case $interface.FaceLandmarkMode.none:
        return $native.FaceLandmarkMode.none;
      case $interface.FaceLandmarkMode.all:
        return $native.FaceLandmarkMode.all;
    }
  }
}
