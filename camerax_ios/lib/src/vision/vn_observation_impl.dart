import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/visionx.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class VNObservationImpl implements VNObservation {
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
