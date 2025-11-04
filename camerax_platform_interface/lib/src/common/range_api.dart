import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class RangeApi {
  RangeApi.impl();

  factory RangeApi(int lower, int upper) =>
      CameraXPlugin.instance.$RangeApi(lower, upper);

  int get lower;
  int get upper;
}
