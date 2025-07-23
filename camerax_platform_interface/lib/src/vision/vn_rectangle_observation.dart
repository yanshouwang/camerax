import 'package:camerax_platform_interface/src/common.dart';

import 'vn_detected_object_observation.dart';

abstract base class VNRectangleObservation extends VNDetectedObjectObservation {
  Future<Point> getBottomLeft();
  Future<Point> getBottomRight();
  Future<Point> getTopLeft();
  Future<Point> getTopRight();

  VNRectangleObservation.impl() : super.impl();
}
