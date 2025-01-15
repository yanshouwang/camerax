import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension FaceContourModeArgs on $interface.FaceContourMode {
  $native.FaceContourMode get obj {
    switch (this) {
      case $interface.FaceContourMode.none:
        return $native.FaceContourMode.none;
      case $interface.FaceContourMode.all:
        return $native.FaceContourMode.all;
    }
  }
}
