import 'package:camerax_platform_interface/src/common.dart';

enum FaceContourType {
  face,
  leftCheek,
  leftEye,
  leftEyebrowBottom,
  leftEyebrowTop,
  lowerLipBottom,
  lowerLipTop,
  noseBottom,
  noseBridge,
  rightCheek,
  rightEye,
  rightEyebrowBottom,
  rightEyebrowTop,
  upperLipBottom,
  upperLipTop,
}

abstract base class FaceContourApi {
  FaceContourApi.impl();

  FaceContourType get type;
  List<PointFApi> get points;
}
