import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum FaceDetectorOptions$ClassificationMode { none, all }

enum FaceDetectorOptions$ContourMode { none, all }

enum FaceDetectorOptions$LandmarkMode { none, all }

enum FaceDetectorOptions$PerformanceMode { fast, accurate }

abstract interface class FaceDetectorOptions$Builder {
  factory FaceDetectorOptions$Builder() =>
      FaceDetectorOptionsChannel.instance.createBuilder();

  Future<FaceDetectorOptions$Builder> enableTracking();
  Future<FaceDetectorOptions$Builder> setClassificationMode(
    FaceDetectorOptions$ClassificationMode classificationMode,
  );
  Future<FaceDetectorOptions$Builder> setContourMode(
    FaceDetectorOptions$ContourMode contourMode,
  );
  // Future<FaceDetectorOptions$Builder> setExecutor(Executor executor);
  Future<FaceDetectorOptions$Builder> setLandmarkMode(
    FaceDetectorOptions$LandmarkMode landmarkMode,
  );
  Future<FaceDetectorOptions$Builder> setMinFaceSize(double minFaceSize);
  Future<FaceDetectorOptions$Builder> setPerformanceMode(
    FaceDetectorOptions$PerformanceMode performanceMode,
  );
  Future<FaceDetectorOptions> build();
}

abstract interface class FaceDetectorOptions {}

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

  FaceDetectorOptions$Builder createBuilder();
}
