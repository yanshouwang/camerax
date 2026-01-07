import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/vision.dart';

abstract interface class VNImageBasedRequest implements VNRequest {
  Future<Rect<double>> getRegionOfInterest();
  Future<void> setRegionOfInterest(Rect<double> value);
}
