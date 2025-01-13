import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'face_classification_mode.dart';
import 'face_contour_mode.dart';
import 'face_landmark_mode.dart';
import 'face_performance_mode.dart';

abstract base class FaceDetectorOptions extends PlatformInterface {
  static final _token = Object();

  FaceDetectorOptions.impl() : super(token: _token);

  factory FaceDetectorOptions({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  }) =>
      CameraX.instance.createFaceDetectorOptions(
        enableTracking: enableTracking,
        classificationMode: classificationMode,
        contourMode: contourMode,
        landmarkMode: landmarkMode,
        minFaceSize: minFaceSize,
        performanceMode: performanceMode,
      );
}
