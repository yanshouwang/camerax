import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract base class ZoomState extends PlatformInterface {
  static final _token = Object();

  @protected
  ZoomState.impl() : super(token: _token);

  double get minZoomRatio;
  double get maxZoomRatio;
  double get zoomRatio;
  double get linearZoom;
}
