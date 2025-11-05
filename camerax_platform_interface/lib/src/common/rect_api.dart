import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class RectApi {
  RectApi.impl();

  factory RectApi(int left, int top, int right, int bottom) =>
      CameraXPlugin.instance.$RectApi(left, top, right, bottom);

  int get left;
  int get top;
  int get right;
  int get bottom;
}

abstract base class RectFApi {
  RectFApi.impl();

  factory RectFApi(double left, double top, double right, double bottom) =>
      CameraXPlugin.instance.$RectFApi(left, top, right, bottom);

  double get left;
  double get top;
  double get right;
  double get bottom;
}
