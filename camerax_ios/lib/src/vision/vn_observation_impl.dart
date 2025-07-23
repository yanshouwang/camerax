import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin VNObservationMixin on VNObservation {
  VNObservationApi get api;

  @override
  Future<String> getUUID() => api.getUUID();
  @override
  Future<double> getConfidence() => api.getConfidence();
}
