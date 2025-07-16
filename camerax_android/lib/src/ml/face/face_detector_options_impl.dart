import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'face_classification_mode_impl.dart';
import 'face_contour_mode_impl.dart';
import 'face_landmark_mode_impl.dart';
import 'face_performance_mode_impl.dart';

final class FaceDetectorOptionsImpl extends FaceDetectorOptions {
  final FaceDetectorOptionsApi api;

  FaceDetectorOptionsImpl.internal(this.api) : super.impl();

  factory FaceDetectorOptionsImpl({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  }) {
    final api = FaceDetectorOptionsApi.build(
      enableTracking: enableTracking,
      classificationMode: classificationMode?.api,
      contourMode: contourMode?.api,
      landmarkMode: landmarkMode?.api,
      minFaceSize: minFaceSize,
      performanceMode: performanceMode?.api,
    );
    return FaceDetectorOptionsImpl.internal(api);
  }
}
