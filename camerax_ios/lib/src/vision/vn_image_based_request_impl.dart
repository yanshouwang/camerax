import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/vision.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class VNImageBasedRequestImpl extends VNRequestImpl
    implements VNImageBasedRequest {
  @override
  VNImageBasedRequestProxyApi get api;

  @override
  Future<Rect<double>> getRegionOfInterest() =>
      api.getRegionOfInterest().then((e) => e.impl);

  @override
  Future<void> setRegionOfInterest(Rect<double> value) =>
      api.setRegionOfInterest(value.api);
}
