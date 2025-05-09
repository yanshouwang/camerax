import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension FaceLandmarkTypeApiX on FaceLandmarkTypeApi {
  FaceLandmarkType get impl {
    switch (this) {
      case FaceLandmarkTypeApi.leftCheek:
        return FaceLandmarkType.leftCheek;
      case FaceLandmarkTypeApi.leftEar:
        return FaceLandmarkType.leftEar;
      case FaceLandmarkTypeApi.leftEye:
        return FaceLandmarkType.leftEye;
      case FaceLandmarkTypeApi.mouthBottom:
        return FaceLandmarkType.mouthBottom;
      case FaceLandmarkTypeApi.mouthLeft:
        return FaceLandmarkType.mouthLeft;
      case FaceLandmarkTypeApi.mouthRight:
        return FaceLandmarkType.mouthRight;
      case FaceLandmarkTypeApi.noseBase:
        return FaceLandmarkType.noseBase;
      case FaceLandmarkTypeApi.rightCheek:
        return FaceLandmarkType.rightCheek;
      case FaceLandmarkTypeApi.rightEar:
        return FaceLandmarkType.rightEar;
      case FaceLandmarkTypeApi.rightEye:
        return FaceLandmarkType.rightEye;
    }
  }
}
