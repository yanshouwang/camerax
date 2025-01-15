import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension FaceClassificationModeArgs on $interface.FaceClassificationMode {
  $native.FaceClassificationMode get obj {
    switch (this) {
      case $interface.FaceClassificationMode.none:
        return $native.FaceClassificationMode.none;
      case $interface.FaceClassificationMode.all:
        return $native.FaceClassificationMode.all;
    }
  }
}
