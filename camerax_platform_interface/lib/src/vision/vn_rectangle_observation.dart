import 'package:camerax_platform_interface/src/common.dart';

import 'vn_detected_object_observation.dart';

abstract base class VNRectangleObservation extends VNDetectedObjectObservation {
  VNRectangleObservation.impl() : super.impl();

  Point<double> get bottomLeft;
  Point<double> get bottomRight;
  Point<double> get topLeft;
  Point<double> get topRight;
}
