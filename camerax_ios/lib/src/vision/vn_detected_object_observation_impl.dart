import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin VNDetectedObjectObservationMixin on VNDetectedObjectObservation {
  VNDetectedObjectObservationApi get api;

  @override
  Future<Rect<int>> getBoundingBox() =>
      api.getBoundingBox().then((e) => e.impl);
}
