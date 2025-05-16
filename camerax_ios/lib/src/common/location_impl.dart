import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension LocationX on Location {
  LocationApi get api {
    return LocationApi(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
