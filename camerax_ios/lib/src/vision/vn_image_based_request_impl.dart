import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_request_impl.dart';

base mixin VNImageBasedRequestImpl on VNImageBasedRequest, VNRequestImpl {
  @override
  VNImageBasedRequestProxyApi get api;

  @override
  Future<Rect<double>> getRegionOfInterest() =>
      api.getRegionOfInterest().then((e) => e.impl);

  @override
  Future<void> setRegionOfInterest(Rect<double> value) =>
      api.setRegionOfInterest(value.api);
}
