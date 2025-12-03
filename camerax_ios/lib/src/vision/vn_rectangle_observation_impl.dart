import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_detected_object_observation_impl.dart';
import 'vn_observation_impl.dart';

base mixin VNRectangleObservationImpl
    on
        VNRectangleObservation,
        VNObservationImpl,
        VNDetectedObjectObservationImpl {
  @override
  VNRectangleObservationProxyApi get api;
}
