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

abstract base class FaceLandmarkApi {
  FaceLandmarkApi.impl();

  FaceLandmarkType get type;
  PointFApi get position;
}
