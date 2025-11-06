import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class LocationImpl extends Location {
  final LocationProxyApi api;

  LocationImpl.internal(this.api) : super.impl();

  factory LocationImpl() {
    final api = LocationProxyApi.provider();
    return LocationImpl.internal(api);
  }

  @override
  Future<double> getLatitude() => api.getLatitude();

  @override
  Future<double> getLongitude() => api.getLongitude();

  @override
  Future<void> setLatitude(double latitudeDegrees) =>
      api.setLatitude(latitudeDegrees);

  @override
  Future<void> setLongitude(double latitudeDegrees) =>
      api.setLongitude(latitudeDegrees);
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
