import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'image_format.dart';
import 'plane_proxy.dart';

abstract base class ImageProxy extends PlatformInterface {
  static final _token = Object();

  ImageProxy.impl() : super(token: _token);

  Future<ImageFormat> getFormat();
  Future<int> getWidth();
  Future<int> getHeight();
  Future<int> getRotationDegrees();
  Future<List<PlaneProxy>> getPlanes();
  Future<int> getTimestamp();
  Future<void> close();
}
