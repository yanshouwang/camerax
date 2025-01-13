import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension FaceContourModeArgs on $base.FaceContourMode {
  $native.FaceContourMode get obj {
    switch (this) {
      case $base.FaceContourMode.none:
        return $native.FaceContourMode.none;
      case $base.FaceContourMode.all:
        return $native.FaceContourMode.all;
    }
  }
}
