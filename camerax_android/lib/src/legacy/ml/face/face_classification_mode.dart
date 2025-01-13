import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension FaceClassificationModeArgs on $base.FaceClassificationMode {
  $native.FaceClassificationMode get obj {
    switch (this) {
      case $base.FaceClassificationMode.none:
        return $native.FaceClassificationMode.none;
      case $base.FaceClassificationMode.all:
        return $native.FaceClassificationMode.all;
    }
  }
}
