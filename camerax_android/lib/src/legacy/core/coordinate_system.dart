import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension CoordinateSystemArgs on $interface.CoordinateSystem {
  $native.CoordinateSystem get obj {
    switch (this) {
      case $interface.CoordinateSystem.original:
        return $native.CoordinateSystem.original;
      case $interface.CoordinateSystem.sensor:
        return $native.CoordinateSystem.sensor;
      case $interface.CoordinateSystem.viewReferenced:
        return $native.CoordinateSystem.viewReferenced;
    }
  }
}
