import 'package:camerax_platform_interface/src/common.dart';

import 'face_contour_api.dart';
import 'face_landmark_api.dart';

abstract base class FaceApi {
  FaceApi.impl();

  RectApi get boundingBox;
  List<FaceContourApi> get allContours;
  List<FaceLandmarkApi> get allLandmarks;
  double get headEulerAngleX;
  double get headEulerAngleY;
  double get headEulerAngleZ;
  double? get leftEyeOpenProbability;
  double? get rightEyeOpenProbability;
  double? get smilingProbability;
  int? get trackingId;

  Future<FaceContourApi?> getContour(FaceContourType contourType);
  Future<FaceLandmarkApi?> getLandmark(FaceLandmarkType landmarkType);
}
