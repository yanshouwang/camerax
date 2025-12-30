import 'package:camerax_platform_interface/src/ml.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class FaceDetector implements Detector<List<Face>> {
  factory FaceDetector() => FaceDetectorChannel.instance.create();

  factory FaceDetector.options(FaceDetectorOptions options) =>
      FaceDetectorChannel.instance.createWithOptions(options);
}

abstract base class FaceDetectorChannel extends PlatformInterface {
  FaceDetectorChannel() : super(token: _token);

  static final _token = Object();

  static FaceDetectorChannel? _instance;

  static FaceDetectorChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(FaceDetectorChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  FaceDetector create();
  FaceDetector createWithOptions(FaceDetectorOptions options);
}
