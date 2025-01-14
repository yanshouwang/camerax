import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'metering_point.dart';

abstract base class MeteringPointFactory extends PlatformInterface {
  static final _token = Object();

  MeteringPointFactory.impl() : super(token: _token);

  Future<MeteringPoint> createPoint(
    double x,
    double y, {
    double? size,
  });
}
