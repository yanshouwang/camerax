import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'metering_point_impl.dart';

base mixin MeteringPointFactoryImpl on MeteringPointFactory {
  MeteringPointFactoryProxyApi get api;

  @override
  Future<MeteringPoint> createPoint(double x, double y, {double? size}) =>
      size == null
      ? api.createPoint1(x, y).then((e) => e.impl)
      : api.createPoint2(x, y, size).then((e) => e.impl);
}
