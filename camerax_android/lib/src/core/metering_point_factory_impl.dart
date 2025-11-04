import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'metering_point_impl.dart';

base mixin MeteringPointFactoryImpl on MeteringPointFactoryApi {
  MeteringPointFactoryApi get api;

  @override
  Future<MeteringPointApi> createPoint(double x, double y, {double? size}) =>
      api.createPoint(x, y, size).then((e) => e.impl);
}
