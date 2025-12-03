import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'metering_point.dart';

abstract base class MeteringPointFactory {
  static Future<double> getDefaultPointSize() =>
      CameraXPlugin.instance.$MeteringPointFactory$getDefaultPointSize();

  MeteringPointFactory.impl();

  Future<MeteringPoint> createPoint(double x, double y, {double? size});
}
