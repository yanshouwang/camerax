import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'detector.dart';

enum FaceClassificationMode { none, all }

enum FaceContourMode { none, all }

enum FaceContourType {
  face,
  leftCheek,
  leftEye,
  leftEyebrowBottom,
  leftEyebrowTop,
  lowerLipBottom,
  lowerLipTop,
  noseBottom,
  noseBridge,
  rightCheek,
  rightEye,
  rightEyebrowBottom,
  rightEyebrowTop,
  upperLipBottom,
  upperLipTop,
}

enum FaceLandmarkMode { none, all }

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

enum FacePerformanceMode { fast, accurate }

abstract base class FaceDetector extends Detector<List<Face>> {
  FaceDetector.impl() : super.impl();

  factory FaceDetector({FaceDetectorOptions? options}) =>
      CameraXPlugin.instance.newFaceDetector(options: options);
}

abstract base class FaceDetectorOptions {
  FaceDetectorOptions.impl();

  factory FaceDetectorOptions({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  }) => CameraXPlugin.instance.newFaceDetectorOptions(
    enableTracking: enableTracking,
    classificationMode: classificationMode,
    contourMode: contourMode,
    landmarkMode: landmarkMode,
    minFaceSize: minFaceSize,
    performanceMode: performanceMode,
  );
}

final class Face {
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

  const Face({
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

final class FaceContour {
  final FaceContourType type;
  final List<Point<double>> points;

  const FaceContour({required this.type, required this.points});
}

final class FaceLandmark {
  final FaceLandmarkType type;
  final Point<double> position;

  const FaceLandmark({required this.type, required this.position});
}
