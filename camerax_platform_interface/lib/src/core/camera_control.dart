import 'focus_metering_action.dart';
import 'focus_metering_result.dart';

abstract base class CameraControl {
  CameraControl.impl();

  Future<void> cancelFocusAndMetering();
  Future<void> enableLowLightBoostAsync(bool lowLightBoost);
  Future<void> enableTorch(bool torch);
  Future<int> setExposureCompensationIndex(int value);
  Future<void> setLinearZoom(double linearZoom);
  Future<void> setTorchStrengthLevel(int torchStrengthLevel);
  Future<void> setZoomRatio(double ratio);
  Future<FocusMeteringResult> startFocusAndMetering(FocusMeteringAction action);
}
