import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/vision.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class VNDetectedObjectObservationImpl extends VNObservationImpl
    implements VNDetectedObjectObservation {
  @override
  VNDetectedObjectObservationProxyApi get api;
}
