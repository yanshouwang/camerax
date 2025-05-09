import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension GeoPointApiX on GeoPointApi {
  GeoPoint get impl {
    return GeoPoint(lat, lng);
  }
}
