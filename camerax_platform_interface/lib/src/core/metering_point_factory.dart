import 'metering_point.dart';

abstract interface class MeteringPointFactory {
  Future<MeteringPoint> createPoint(
    double x,
    double y, {
    double? size,
  });
}
