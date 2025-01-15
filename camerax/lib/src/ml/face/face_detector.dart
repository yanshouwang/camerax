import 'package:camerax/src/ml/detector.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

import 'face_detector_options.dart';

final class FaceDetector extends Detector<List<$interface.Face>> {
  final $interface.FaceDetector _obj;

  FaceDetector({
    FaceDetectorOptions? options,
  }) : _obj = $interface.FaceDetector(
          options: options?.obj,
        );

  @internal
  @override
  $interface.FaceDetector get obj => _obj;
}
