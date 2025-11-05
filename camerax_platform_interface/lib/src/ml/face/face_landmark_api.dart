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

  Future<FaceLandmarkType> getLandmarkType();
  Future<PointFApi> getPosition();
}
