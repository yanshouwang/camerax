import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'face_contour_impl.dart';
import 'face_landmark_impl.dart';

final class FaceImpl extends FaceApi {
  final FaceProxyApi api;

  FaceImpl.internal(this.api) : super.impl();

  @override
  List<FaceContourApi> get allContours =>
      api.allContours.map((e) => e.impl).toList();
  @override
  List<FaceLandmarkApi> get allLandmarks =>
      api.allLandmarks.map((e) => e.impl).toList();
  @override
  RectApi get boundingBox => api.boundingBox.impl;
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

  @override
  Future<FaceContourApi?> getContour(FaceContourType contourType) =>
      api.getContour(contourType.api).then((e) => e?.impl);

  @override
  Future<FaceLandmarkApi?> getLandmark(FaceLandmarkType landmarkType) =>
      api.getLandmark(landmarkType.api).then((e) => e?.impl);
}

extension FaceProxyApiX on FaceProxyApi {
  FaceApi get impl => FaceImpl.internal(this);
}
