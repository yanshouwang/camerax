import 'package:camerax_platform_interface/src/common.dart';

import 'vn_request.dart';

abstract base class VNImageBasedRequest extends VNRequest {
  VNImageBasedRequest.impl() : super.impl();

  Future<Rect<double>> getRegionOfInterest();
  Future<void> setRegionOfInterest(Rect<double> value);
}
