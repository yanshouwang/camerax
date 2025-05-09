import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'focus_metering_action.dart';

final _token = Object();

abstract interface class CameraControl {
  Future<void> enableTorch(bool torch);
  Future<void> setZoomRatio(double ratio);
  Future<void> setLinearZoom(double linearZoom);
  Future<bool> startFocusAndMetering(FocusMeteringAction action);
  Future<void> cancelFocusAndMetering();
  Future<int> setExposureCompensationIndex(int value);
}

abstract base class CameraControlChannel extends PlatformInterface
    implements CameraControl {
  CameraControlChannel.impl() : super(token: _token);
}
