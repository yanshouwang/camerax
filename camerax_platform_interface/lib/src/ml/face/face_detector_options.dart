import 'package:camerax_platform_interface/src/camerax_plugin.dart';

enum FaceDetectorOptionsClassificationMode { none, all }

enum FaceDetectorOptionsContourMode { none, all }

enum FaceDetectorOptionsLandmarkMode { none, all }

enum FaceDetectorOptionsPerformanceMode { fast, accurate }

abstract base class FaceDetectorOptions {
  FaceDetectorOptions.impl();

  factory FaceDetectorOptions({
    bool? enableTracking,
    FaceDetectorOptionsClassificationMode? classificationMode,
    FaceDetectorOptionsContourMode? contourMode,
    FaceDetectorOptionsLandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceMode? performanceMode,
  }) => CameraXPlugin.instance.newFaceDetectorOptions(
    enableTracking: enableTracking,
    classificationMode: classificationMode,
    contourMode: contourMode,
    landmarkMode: landmarkMode,
    minFaceSize: minFaceSize,
    performanceMode: performanceMode,
  );
}
