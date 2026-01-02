import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class MeteringPointFactoryImpl implements MeteringPointFactory {
  MeteringPointFactoryProxyApi get api;

  @override
  Future<MeteringPoint> createPoint(double x, double y, {double? size}) =>
      size == null
      ? api.createPoint1(x, y).then((e) => e.impl)
      : api.createPoint2(x, y, size).then((e) => e.impl);
}

final class MeteringPointFactoryChannelImpl
    extends MeteringPointFactoryChannel {
  @override
  Future<double> getDefaultPointSize() =>
      MeteringPointFactoryProxyApi.getDefaultPointSize();
}
