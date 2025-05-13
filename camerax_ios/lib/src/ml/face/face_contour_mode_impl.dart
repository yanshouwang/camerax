import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension FaceContourModeX on FaceContourMode {
  FaceContourModeApi get api {
    switch (this) {
      case FaceContourMode.none:
        return FaceContourModeApi.none;
      case FaceContourMode.all:
        return FaceContourModeApi.all;
    }
  }
}
