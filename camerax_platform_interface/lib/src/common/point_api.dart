import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class PointApi {
  PointApi.impl();

  factory PointApi(int x, int y) => CameraXPlugin.instance.$PointApi(x, y);

  int get x;
  int get y;
}

abstract base class PointFApi {
  PointFApi.impl();

  factory PointFApi(double x, double y) =>
      CameraXPlugin.instance.$PointFApi(x, y);

  double get x;
  double get y;
}
