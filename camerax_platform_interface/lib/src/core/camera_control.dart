import 'focus_metering_action.dart';

abstract base class CameraControl {
  CameraControl.impl();

  Future<void> enableTorch(bool torch);
  Future<void> setZoomRatio(double ratio);
  Future<void> setLinearZoom(double linearZoom);
  Future<bool> startFocusAndMetering(FocusMeteringAction action);
  Future<void> cancelFocusAndMetering();
  Future<int> setExposureCompensationIndex(int value);
}
