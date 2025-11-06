import 'package:camerax_platform_interface/src/common.dart';
import 'package:collection/collection.dart';

import 'face_contour.dart';
import 'face_landmark.dart';

abstract base class Face {
  Face.impl();

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

  FaceContour? getContour(FaceContourType type) =>
      allContours.firstWhereOrNull((e) => e.type == type);

  FaceLandmark? getLandmark(FaceLandmarkType type) =>
      allLandmarks.firstWhereOrNull((e) => e.type == type);
}
