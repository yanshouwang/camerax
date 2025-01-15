import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension RectObj on $native.Rect {
  $interface.Rect get args {
    return $interface.Rect(left, top, right, bottom);
  }
}
