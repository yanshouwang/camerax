import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum FaceDetectorOptions$ClassificationMode { none, all }

enum FaceDetectorOptions$ContourMode { none, all }

enum FaceDetectorOptions$LandmarkMode { none, all }

enum FaceDetectorOptions$PerformanceMode { fast, accurate }

abstract interface class FaceDetectorOptions {
  factory FaceDetectorOptions({
    bool? enableTracking,
    FaceDetectorOptions$ClassificationMode? classificationMode,
    FaceDetectorOptions$ContourMode? contourMode,
    FaceDetectorOptions$LandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptions$PerformanceMode? performanceMode,
  }) => FaceDetectorOptionsChannel.instance.create(
    enableTracking: enableTracking,
    classificationMode: classificationMode,
    contourMode: contourMode,
    landmarkMode: landmarkMode,
    minFaceSize: minFaceSize,
    performanceMode: performanceMode,
  );
}

abstract base class FaceDetectorOptionsChannel extends PlatformInterface {
  FaceDetectorOptionsChannel() : super(token: _token);

  static final _token = Object();

  static FaceDetectorOptionsChannel? _instance;

  static FaceDetectorOptionsChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(FaceDetectorOptionsChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  FaceDetectorOptions create({
    bool? enableTracking,
    FaceDetectorOptions$ClassificationMode? classificationMode,
    FaceDetectorOptions$ContourMode? contourMode,
    FaceDetectorOptions$LandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptions$PerformanceMode? performanceMode,
  });
}
