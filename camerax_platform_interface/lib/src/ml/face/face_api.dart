import 'package:camerax_platform_interface/src/common.dart';

import 'face_contour_api.dart';
import 'face_landmark_api.dart';

abstract base class FaceApi {
  FaceApi.impl();

  Future<List<FaceContourApi>> getAllContours();
  Future<List<FaceLandmarkApi>> getAllLandmarks();
  Future<RectApi> getBoundingBox();
  Future<FaceContourApi?> getContour(FaceContourType contourType);
  Future<double> getHeadEulerAngleX();
  Future<double> getHeadEulerAngleY();
  Future<double> getHeadEulerAngleZ();
  Future<FaceLandmarkApi?> getLandmark(FaceLandmarkType landmarkType);
  Future<double?> getLeftEyeOpenProbability();
  Future<double?> getRightEyeOpenProbability();
  Future<double?> getSmilingProbability();
  Future<int?> getTrackingId();
}
