import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class LocationImpl extends Location {
  final CLLocationProxyApi api;

  LocationImpl.internal(this.api) : super.impl();

  factory LocationImpl(double latitude, double longitude) {
    final api = CLLocationProxyApi(latitude: latitude, longitude: longitude);
    return LocationImpl.internal(api);
  }

  @override
  double get latitude => api.latitude;

  @override
  double get longitude => api.longitude;
}

extension LocationX on Location {
  CLLocationProxyApi get api {
    final impl = this;
    if (impl is! LocationImpl) throw TypeError();
    return impl.api;
  }
}

extension CLLocationProxyApiX on CLLocationProxyApi {
  Location get impl => LocationImpl.internal(this);
}
