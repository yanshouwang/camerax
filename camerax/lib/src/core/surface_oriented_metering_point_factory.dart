import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

import 'metering_point_factory.dart';

final class SurfaceOrientedMeteringPointFactory extends MeteringPointFactory {
  final $base.SurfaceOrientedMeteringPointFactory _obj;

  SurfaceOrientedMeteringPointFactory(double width, double height)
      : _obj = $base.SurfaceOrientedMeteringPointFactory(width, height);

  @internal
  @override
  $base.MeteringPointFactory get obj => _obj;
}
