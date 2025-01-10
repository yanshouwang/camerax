import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract base class PlaneProxy extends PlatformInterface {
  static final _token = Object();

  PlaneProxy.impl() : super(token: _token);

  Future<Uint8List> getBuffer();
  Future<int> getPixelStride();
  Future<int> getRowStride();
}
