import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/visionx.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin VNObservationImpl on VNObservation {
  VNObservationProxyApi get api;
}

extension VNObservationX on VNObservation {
  VisionObject? get visionObjectOrNull {
    final observation = this;
    if (observation is VNBarcodeObservation) {
      return VisionMachineReadableCodeObjectVNImpl.internal(observation);
    }
    if (observation is VNFaceObservation) {
      return VisionFaceObjectVNImpl.internal(observation);
    }
    return null;
  }
}
