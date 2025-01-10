import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract base class ZoomState extends PlatformInterface {
  static final _token = Object();

  @protected
  ZoomState.impl() : super(token: _token);

  Future<double> getMinZoomRatio();
  Future<double> getMaxZoomRatio();
  Future<double> getZoomRatio();
  Future<double> getLinearZoom();
}
