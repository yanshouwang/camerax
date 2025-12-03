import 'package:camerax_platform_interface/src/common.dart';

import 'vn_observation.dart';

abstract base class VNDetectedObjectObservation extends VNObservation {
  VNDetectedObjectObservation.impl() : super.impl();

  Rect<double> get boundingBox;
}
