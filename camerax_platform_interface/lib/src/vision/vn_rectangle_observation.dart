import 'package:camerax_platform_interface/src/common.dart';

import 'vn_detected_object_observation.dart';

abstract base class VNRectangleObservation extends VNDetectedObjectObservation {
  Future<Point<int>> getBottomLeft();
  Future<Point<int>> getBottomRight();
  Future<Point<int>> getTopLeft();
  Future<Point<int>> getTopRight();

  VNRectangleObservation.impl() : super.impl();
}
