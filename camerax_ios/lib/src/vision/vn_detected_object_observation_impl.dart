import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_observation_impl.dart';

base mixin VNDetectedObjectObservationImpl
    on VNDetectedObjectObservation, VNObservationImpl {
  @override
  VNDetectedObjectObservationProxyApi get api;
}
