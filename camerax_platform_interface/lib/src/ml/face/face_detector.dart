import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/ml/interfaces.dart';

import 'face.dart';
import 'face_detector_options.dart';

abstract base class FaceDetector extends Detector<List<Face>> {
  FaceDetector.impl() : super.impl();

  factory FaceDetector() => CameraXPlugin.instance.$FaceDetector();

  factory FaceDetector.options(FaceDetectorOptions options) =>
      CameraXPlugin.instance.$FaceDetector$options(options);
}
