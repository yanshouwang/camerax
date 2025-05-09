import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension FaceContourTypeApiX on FaceContourTypeApi {
  FaceContourType get impl {
    switch (this) {
      case FaceContourTypeApi.face:
        return FaceContourType.face;
      case FaceContourTypeApi.leftCheek:
        return FaceContourType.leftCheek;
      case FaceContourTypeApi.leftEye:
        return FaceContourType.leftEye;
      case FaceContourTypeApi.leftEyebrowBottom:
        return FaceContourType.leftEyebrowBottom;
      case FaceContourTypeApi.leftEyebrowTop:
        return FaceContourType.leftEyebrowTop;
      case FaceContourTypeApi.lowerLipBottom:
        return FaceContourType.lowerLipBottom;
      case FaceContourTypeApi.lowerLipTop:
        return FaceContourType.lowerLipTop;
      case FaceContourTypeApi.noseBottom:
        return FaceContourType.noseBottom;
      case FaceContourTypeApi.noseBridge:
        return FaceContourType.noseBridge;
      case FaceContourTypeApi.rightCheek:
        return FaceContourType.rightCheek;
      case FaceContourTypeApi.rightEye:
        return FaceContourType.rightEye;
      case FaceContourTypeApi.rightEyebrowBottom:
        return FaceContourType.rightEyebrowBottom;
      case FaceContourTypeApi.rightEyebrowTop:
        return FaceContourType.rightEyebrowTop;
      case FaceContourTypeApi.upperLipBottom:
        return FaceContourType.upperLipBottom;
      case FaceContourTypeApi.upperLipTop:
        return FaceContourType.upperLipTop;
    }
  }
}
