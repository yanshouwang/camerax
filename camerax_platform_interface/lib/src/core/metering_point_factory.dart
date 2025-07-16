import 'metering_point.dart';

abstract base class MeteringPointFactory {
  MeteringPointFactory.impl();

  Future<MeteringPoint> createPoint(
    double x,
    double y, {
    double? size,
  });
}
