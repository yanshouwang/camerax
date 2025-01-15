import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

import 'metering_point_factory.dart';

final class SurfaceOrientedMeteringPointFactory extends MeteringPointFactory {
  final $interface.SurfaceOrientedMeteringPointFactory _obj;

  SurfaceOrientedMeteringPointFactory(double width, double height)
      : _obj = $interface.SurfaceOrientedMeteringPointFactory(width, height);

  @internal
  @override
  $interface.MeteringPointFactory get obj => _obj;
}
