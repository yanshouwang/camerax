import 'package:camerax_platform_interface/src/common.dart';

enum FaceLandmarkType {
  leftCheek,
  leftEar,
  leftEye,
  mouthBottom,
  mouthLeft,
  mouthRight,
  noseBase,
  rightCheek,
  rightEar,
  rightEye,
}

final class FaceLandmark {
  final FaceLandmarkType type;
  final Point<double> position;

  const FaceLandmark({required this.type, required this.position});
}
