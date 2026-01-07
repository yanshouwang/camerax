import 'package:camerax_platform_interface/src/core.dart';

abstract interface class CameraControl {
  Future<void> cancelFocusAndMetering();
  Future<void> enableLowLightBoostAsync(bool lowLightBoost);
  Future<void> enableTorch(bool torch);
  Future<int> setExposureCompensationIndex(int value);
  Future<void> setLinearZoom(double linearZoom);
  Future<void> setTorchStrengthLevel(int torchStrengthLevel);
  Future<void> setZoomRatio(double ratio);
  Future<FocusMeteringResult> startFocusAndMetering(FocusMeteringAction action);
}
