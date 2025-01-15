import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'face_classification_mode.dart';
import 'face_contour_mode.dart';
import 'face_landmark_mode.dart';
import 'face_performance_mode.dart';

final class FaceDetectorOptions extends $interface.FaceDetectorOptions {
  final $native.FaceDetectorOptions obj;

  FaceDetectorOptions.$native(this.obj) : super.impl();

  factory FaceDetectorOptions({
    bool? enableTracking,
    $interface.FaceClassificationMode? classificationMode,
    $interface.FaceContourMode? contourMode,
    $interface.FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    $interface.FacePerformanceMode? performanceMode,
  }) {
    final obj = $native.FaceDetectorOptions.build(
      enableTracking: enableTracking,
      classificationMode: classificationMode?.obj,
      contourMode: contourMode?.obj,
      landmarkMode: landmarkMode?.obj,
      minFaceSize: minFaceSize,
      performanceMode: performanceMode?.obj,
    );
    return FaceDetectorOptions.$native(obj);
  }
}
