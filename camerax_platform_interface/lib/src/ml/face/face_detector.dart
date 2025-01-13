import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:camerax_platform_interface/src/ml/detector.dart';

import 'face.dart';
import 'face_detector_options.dart';

abstract base class FaceDetector extends Detector<List<Face>> {
  FaceDetector.impl() : super.impl();

  factory FaceDetector({
    FaceDetectorOptions? options,
  }) =>
      CameraX.instance.createFaceDetector(
        options: options,
      );
}
