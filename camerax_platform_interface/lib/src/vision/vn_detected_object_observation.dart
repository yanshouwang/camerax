import 'package:camerax_platform_interface/src/common.dart';

import 'vn_observation.dart';

abstract base class VNDetectedObjectObservation extends VNObservation {
  final Rect<double> boundingBox;

  VNDetectedObjectObservation.impl({
    required super.uuid,
    required super.confidence,
    required this.boundingBox,
  }) : super.impl();
}
