import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension RectObj on $native.Rect {
  $base.Rect get args {
    return $base.Rect(left, top, right, bottom);
  }
}
