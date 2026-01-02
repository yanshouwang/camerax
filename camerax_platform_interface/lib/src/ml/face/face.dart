import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/ml.dart';

abstract interface class Face {
  Rect<int> get boundingBox;
  List<FaceContour> get allContours;
  List<FaceLandmark> get allLandmarks;
  double get headEulerAngleX;
  double get headEulerAngleY;
  double get headEulerAngleZ;
  double? get leftEyeOpenProbability;
  double? get rightEyeOpenProbability;
  double? get smilingProbability;
  int? get trackingId;

  Future<FaceContour?> getContour(FaceContour$Type type);
  Future<FaceLandmark?> getLandmark(FaceLandmark$Type type);
}
