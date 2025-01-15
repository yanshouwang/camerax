import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension PointObj on $native.Point {
  $interface.Point<int> get args {
    return $interface.Point(x, y);
  }
}

extension PointFObj on $native.PointF {
  $interface.Point<double> get args {
    return $interface.Point(x, y);
  }
}
