import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class LocationImpl extends Location {
  final CLLocationApi api;

  LocationImpl.internal(this.api) : super.impl();

  factory LocationImpl(double latitude, double longitude) {
    final api = CLLocationApi(latitude: latitude, longitude: longitude);
    return LocationImpl.internal(api);
  }
}

extension LocationX on Location {
  CLLocationApi get api {
    final impl = this;
    if (impl is! LocationImpl) throw TypeError();
    return impl.api;
  }
}
