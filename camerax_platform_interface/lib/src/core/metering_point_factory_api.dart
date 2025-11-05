import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'metering_point_api.dart';

abstract base class MeteringPointFactoryApi {
  static Future<double> getDefaultPointSize() =>
      CameraXPlugin.instance.$MeteringPointFactoryApiGetDefaultPointSize();

  MeteringPointFactoryApi.impl();

  Future<MeteringPointApi> createPoint(double x, double y, {double? size});
}
