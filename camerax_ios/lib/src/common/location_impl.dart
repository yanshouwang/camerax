import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension LocationX on Location {
  CLLocationApi get api =>
      CLLocationApi(latitude: latitude, longitude: longitude);
}
