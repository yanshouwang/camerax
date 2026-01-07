import 'package:camerax_platform_interface/src/common.dart';

enum FaceLandmark$Type {
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

abstract interface class FaceLandmark {
  FaceLandmark$Type get type;
  Point<double> get position;
}
