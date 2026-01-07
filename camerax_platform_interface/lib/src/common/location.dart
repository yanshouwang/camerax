import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Location {
  factory Location(double latitude, double longitude) =>
      LocationChannel.instance.create(latitude, longitude);

  double get latitude;
  double get longitude;
}

abstract base class LocationChannel extends PlatformInterface {
  LocationChannel() : super(token: _token);

  static final _token = Object();

  static LocationChannel? _instance;

  static LocationChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(LocationChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Location create(double latitude, double longitude);
}
