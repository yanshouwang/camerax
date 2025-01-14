import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension LocationArgs on $base.Location {
  $native.Location get obj {
    return $native.Location(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
