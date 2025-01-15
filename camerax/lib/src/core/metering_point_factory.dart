import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

import 'metering_point.dart';

abstract base class MeteringPointFactory {
  @internal
  $interface.MeteringPointFactory get obj;

  Future<MeteringPoint> createPoint({
    required double x,
    required double y,
    double? size,
  }) async {
    final obj = await this.obj.createPoint(
          x,
          y,
          size: size,
        );
    return obj.args;
  }
}
