import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension FaceLandmarkModeX on FaceLandmarkMode {
  FaceLandmarkModeApi get api {
    switch (this) {
      case FaceLandmarkMode.none:
        return FaceLandmarkModeApi.none;
      case FaceLandmarkMode.all:
        return FaceLandmarkModeApi.all;
    }
  }
}
