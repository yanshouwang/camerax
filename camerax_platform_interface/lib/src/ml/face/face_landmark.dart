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

abstract base class FaceLandmark {
  FaceLandmark.impl();

  FaceLandmarkType get type;
  Point<double> get position;
}
