import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension GeoPointObj on $native.GeoPoint {
  $base.GeoPoint get args {
    return $base.GeoPoint(lat, lng);
  }
}
