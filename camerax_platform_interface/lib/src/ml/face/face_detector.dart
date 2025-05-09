import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/ml/detector.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'face.dart';
import 'face_detector_options.dart';

final _token = Object();

abstract interface class FaceDetector implements Detector<List<Face>> {
  factory FaceDetector({
    FaceDetectorOptions? options,
  }) {
    final instance = CameraXPlugin.instance.newFaceDetector(
      options: options,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class FaceDetectorChannel extends PlatformInterface
    implements FaceDetector {
  FaceDetectorChannel.impl() : super(token: _token);
}
