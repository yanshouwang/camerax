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

final class FaceContour {
  final FaceContourType type;
  final List<Point<double>> points;

  const FaceContour({required this.type, required this.points});
}
