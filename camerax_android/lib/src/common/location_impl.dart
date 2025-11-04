import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class LocationImpl extends LocationApi {
  final LocationProxyApi api;

  LocationImpl.internal(this.api) : super.impl();

  factory LocationImpl(double latitude, double longitude) {
    final api = LocationProxyApi(latitude: latitude, longitude: longitude);
    return LocationImpl.internal(api);
  }
}

extension LocationApiX on LocationApi {
  LocationProxyApi get api {
    final impl = this;
    if (impl is! LocationImpl) throw TypeError();
    return impl.api;
  }
}
