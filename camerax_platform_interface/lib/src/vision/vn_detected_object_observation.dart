import 'package:camerax_platform_interface/src/common.dart';

import 'vn_observation.dart';

abstract base class VNDetectedObjectObservation extends VNObservation {
  Future<Rect<int>> getBoundingBox();

  VNDetectedObjectObservation.impl() : super.impl();
}
