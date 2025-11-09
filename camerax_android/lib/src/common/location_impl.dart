import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class LocationImpl extends Location {
  final LocationProxyApi api;

  LocationImpl.internal(this.api) : super.impl();

  factory LocationImpl(double latitude, double longitude) {
    final api = LocationProxyApi(latitude: latitude, longitude: longitude);
    return LocationImpl.internal(api);
  }

  @override
  double get latitude => api.latitude;

  @override
  double get longitude => api.longitude;
}

extension LocationX on Location {
  LocationProxyApi get api {
    final impl = this;
    if (impl is! LocationImpl) throw TypeError();
    return impl.api;
  }
}

extension LocationProxyApiX on LocationProxyApi {
  Location get impl => LocationImpl.internal(this);
}
