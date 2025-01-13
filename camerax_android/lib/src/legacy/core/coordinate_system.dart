import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension CoordinateSystemArgs on $base.CoordinateSystem {
  $native.CoordinateSystem get obj {
    switch (this) {
      case $base.CoordinateSystem.original:
        return $native.CoordinateSystem.original;
      case $base.CoordinateSystem.sensor:
        return $native.CoordinateSystem.sensor;
      case $base.CoordinateSystem.viewReferenced:
        return $native.CoordinateSystem.viewReferenced;
    }
  }
}
