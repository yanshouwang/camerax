import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'face_classification_mode.dart';
import 'face_contour_mode.dart';
import 'face_landmark_mode.dart';
import 'face_performance_mode.dart';

abstract base class FaceDetectorOptions {
  FaceDetectorOptions.impl();

  factory FaceDetectorOptions({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  }) =>
      CameraXPlugin.instance.newFaceDetectorOptions(
        enableTracking: enableTracking,
        classificationMode: classificationMode,
        contourMode: contourMode,
        landmarkMode: landmarkMode,
        minFaceSize: minFaceSize,
        performanceMode: performanceMode,
      );
}
