import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/ml.dart';
import 'package:collection/collection.dart';

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

  FaceContour? getContour(FaceContour$Type type) =>
      allContours.firstWhereOrNull((e) => e.type == type);

  FaceLandmark? getLandmark(FaceLandmark$Type type) =>
      allLandmarks.firstWhereOrNull((e) => e.type == type);
}
