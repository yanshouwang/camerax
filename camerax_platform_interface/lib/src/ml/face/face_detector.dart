import 'package:camerax_platform_interface/src/ml/interfaces.dart';

import 'face.dart';

abstract base class FaceDetector extends Detector<List<Face>> {
  FaceDetector.impl() : super.impl();
}
