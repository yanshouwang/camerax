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

  Future<FaceContourType> getFaceContourType();
  Future<List<PointFApi>> getPoints();
}
