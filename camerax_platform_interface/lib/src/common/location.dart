import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class Location {
  Location.impl();

  factory Location(double latitude, double longitude) =>
      CameraXPlugin.instance.newLocation(latitude, longitude);
}
