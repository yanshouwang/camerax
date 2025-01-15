import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/ml/detector.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'face_detector_options.dart';

final class FaceDetector extends $interface.FaceDetector with Detector {
  @override
  final $native.FaceDetector obj;

  FaceDetector.$native(this.obj) : super.impl();

  factory FaceDetector({
    $interface.FaceDetectorOptions? options,
  }) {
    if (options is! FaceDetectorOptions?) {
      throw TypeError();
    }
    final obj = $native.FaceDetector(
      options: options?.obj,
    );
    return FaceDetector.$native(obj);
  }
}
