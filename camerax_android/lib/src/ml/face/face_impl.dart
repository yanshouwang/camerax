import 'package:camerax_android/src/ml.dart';
import 'package:camerax_android/src/visionx.dart';
import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FaceImpl implements Face {
  final FaceProxyApi api;

  FaceImpl.internal(this.api);

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

  @override
  Future<FaceContour?> getContour(FaceContour$Type contourType) =>
      api.getContour(contourType.api).then((e) => e?.impl);

  @override
  Future<FaceLandmark?> getLandmark(FaceLandmark$Type landmarkType) =>
      api.getLandmark(landmarkType.api).then((e) => e?.impl);
}

extension FaceX on Face {
  VisionFaceObject visionFaceObject({required Size<int>? imageSize}) =>
      VisionFaceObjectImpl.internal(this, imageSize: imageSize);
}

extension FaceProxyApiX on FaceProxyApi {
  Face get impl => FaceImpl.internal(this);
}
