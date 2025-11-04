import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class LocationApi {
  LocationApi.impl();

  factory LocationApi(double latitude, double longitude) =>
      CameraXPlugin.instance.$LocationApi(latitude, longitude);
}
