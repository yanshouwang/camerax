import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'face_detector.dart';
import 'face_detector_options.dart';

abstract base class FaceDetection {
  static Future<FaceDetector> getClient([FaceDetectorOptions? options]) =>
      CameraXPlugin.instance.$FaceDetectionGetClient(options);

  FaceDetection.impl();
}
