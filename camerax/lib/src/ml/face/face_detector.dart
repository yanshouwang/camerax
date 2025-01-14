import 'package:camerax/src/ml/detector.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

import 'face_detector_options.dart';

final class FaceDetector extends Detector<List<$base.Face>> {
  final $base.FaceDetector _obj;

  FaceDetector({
    FaceDetectorOptions? options,
  }) : _obj = $base.FaceDetector(
          options: options?.obj,
        );

  @internal
  @override
  $base.FaceDetector get obj => _obj;
}
