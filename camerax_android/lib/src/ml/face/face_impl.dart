import 'package:camerax_android/src/vision.dart';
import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'face_contour_impl.dart';
import 'face_landmark_impl.dart';

final class FaceImpl extends Face {
  final FaceProxyApi api;

  FaceImpl.internal(this.api) : super.impl();

  @override
  List<FaceContour> get allContours =>
      api.allContours.map((e) => e.impl).toList();
  @override
  List<FaceLandmark> get allLandmarks =>
      api.allLandmarks.map((e) => e.impl).toList();
  @override
  Rect<int> get boundingBox => api.boundingBox.impl;
  @override
  double get headEulerAngleX => api.headEulerAngleX;
  @override
  double get headEulerAngleY => api.headEulerAngleY;
  @override
  double get headEulerAngleZ => api.headEulerAngleZ;
  @override
  double? get leftEyeOpenProbability => api.leftEyeOpenProbability;
  @override
  double? get rightEyeOpenProbability => api.rightEyeOpenProbability;
  @override
  double? get smilingProbability => api.smilingProbability;
  @override
  int? get trackingId => api.trackingId;
}

extension FaceProxyApiX on FaceProxyApi {
  Face get impl => FaceImpl.internal(this);

  VisionFaceObject get vimpl => VisionFaceObjectImpl.internal(this);
}
