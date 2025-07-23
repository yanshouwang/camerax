import 'package:camerax_platform_interface/src/common.dart';

import 'face_contour.dart';
import 'face_contour_type.dart';
import 'face_landmark.dart';
import 'face_landmark_type.dart';

class Face {
  final Rect<int> boundingBox;
  final List<FaceContour> allContours;
  final List<FaceLandmark> allLandmarks;
  final double headEulerAngleX;
  final double headEulerAngleY;
  final double headEulerAngleZ;
  final double? leftEyeOpenProbability;
  final double? rightEyeOpenProbability;
  final double? smilingProbability;
  final int? trackingId;

  Face({
    required this.boundingBox,
    required this.allContours,
    required this.allLandmarks,
    required this.headEulerAngleX,
    required this.headEulerAngleY,
    required this.headEulerAngleZ,
    required this.leftEyeOpenProbability,
    required this.rightEyeOpenProbability,
    required this.smilingProbability,
    required this.trackingId,
  });

  FaceContour? getContour(FaceContourType contourType) {
    final index = allContours.indexWhere(
      (contour) => contour.type == contourType,
    );
    return index < 0 ? null : allContours[index];
  }

  FaceLandmark? getLandmark(FaceLandmarkType landmarkType) {
    final index = allLandmarks.indexWhere(
      (landmark) => landmark.type == landmarkType,
    );
    return index < 0 ? null : allLandmarks[index];
  }
}
