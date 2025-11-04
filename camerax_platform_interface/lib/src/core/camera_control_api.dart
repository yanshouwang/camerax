import 'focus_metering_action_api.dart';

abstract base class CameraControlApi {
  CameraControlApi.impl();

  Future<void> enableTorch(bool torch);
  Future<void> setZoomRatio(double ratio);
  Future<void> setLinearZoom(double linearZoom);
  Future<bool> startFocusAndMetering(FocusMeteringActionApi action);
  Future<void> cancelFocusAndMetering();
  Future<int> setExposureCompensationIndex(int value);
}
