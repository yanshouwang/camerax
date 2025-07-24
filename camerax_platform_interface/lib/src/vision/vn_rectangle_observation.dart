import 'package:camerax_platform_interface/src/common.dart';

import 'vn_detected_object_observation.dart';

abstract base class VNRectangleObservation extends VNDetectedObjectObservation {
  final Point<double> bottomLeft;
  final Point<double> bottomRight;
  final Point<double> topLeft;
  final Point<double> topRight;

  VNRectangleObservation.impl({
    required super.uuid,
    required super.confidence,
    required super.boundingBox,
    required this.bottomLeft,
    required this.bottomRight,
    required this.topLeft,
    required this.topRight,
  }) : super.impl();
}
