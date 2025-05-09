import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'face_classification_mode.dart';
import 'face_contour_mode.dart';
import 'face_landmark_mode.dart';
import 'face_performance_mode.dart';

final _token = Object();

abstract interface class FaceDetectorOptions {
  factory FaceDetectorOptions({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  }) {
    final instance = CameraXPlugin.instance.newFaceDetectorOptions(
      enableTracking: enableTracking,
      classificationMode: classificationMode,
      contourMode: contourMode,
      landmarkMode: landmarkMode,
      minFaceSize: minFaceSize,
      performanceMode: performanceMode,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class FaceDetectorOptionsChannel extends PlatformInterface
    implements FaceDetectorOptions {
  FaceDetectorOptionsChannel.impl() : super(token: _token);
}
