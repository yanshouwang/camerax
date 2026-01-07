import 'package:camerax_platform_interface/src/common.dart';

enum FaceContour$Type {
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

abstract interface class FaceContour {
  FaceContour$Type get type;
  List<Point<double>> get points;
}
