import 'package:camerax_ios/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class LocationImpl implements Location {
  final CLLocationProxyApi api;

  LocationImpl.internal(this.api);

  @override
  double get latitude => api.latitude;

  @override
  double get longitude => api.longitude;
}

final class LocationChannelImpl extends LocationChannel {
  @override
  Location create(double latitude, double longitude) {
    final api = CLLocationProxyApi(latitude: latitude, longitude: longitude);
    return LocationImpl.internal(api);
  }
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
