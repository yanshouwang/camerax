import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension FaceClassificationModeX on FaceClassificationMode {
  FaceClassificationModeApi get api {
    switch (this) {
      case FaceClassificationMode.none:
        return FaceClassificationModeApi.none;
      case FaceClassificationMode.all:
        return FaceClassificationModeApi.all;
    }
  }
}
