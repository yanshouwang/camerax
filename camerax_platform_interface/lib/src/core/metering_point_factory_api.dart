import 'metering_point_api.dart';

abstract base class MeteringPointFactoryApi {
  MeteringPointFactoryApi.impl();

  Future<MeteringPointApi> createPoint(double x, double y, {double? size});
}
