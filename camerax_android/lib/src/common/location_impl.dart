import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension LocationX on Location {
  LocationApi get api {
    return LocationApi(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
