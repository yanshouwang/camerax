import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension PointObj on $native.Point {
  $base.Point<int> get args {
    return $base.Point(x, y);
  }
}

extension PointFObj on $native.PointF {
  $base.Point<double> get args {
    return $base.Point(x, y);
  }
}
