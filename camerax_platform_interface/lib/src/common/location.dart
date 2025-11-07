import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class Location {
  Location.impl();

  factory Location() => CameraXPlugin.instance.$Location();

  Future<double> getLatitude();
  Future<double> getLongitude();
  Future<void> setLatitude(double latitudeDegrees);
  Future<void> setLongitude(double longitudeDegrees);
}
