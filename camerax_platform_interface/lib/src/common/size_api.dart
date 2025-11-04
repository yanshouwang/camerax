import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class SizeApi {
  SizeApi.impl();

  factory SizeApi(int width, int height) =>
      CameraXPlugin.instance.$SizeApi(width, height);

  int get width;
  int get height;
}
