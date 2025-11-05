import 'focus_metering_action_api.dart';
import 'focus_metering_result_api.dart';

abstract base class CameraControlApi {
  CameraControlApi.impl();

  Future<void> cancelFocusAndMetering();
  Future<void> enableLowLightBoostAsync(bool lowLightBoost);
  Future<void> enableTorch(bool torch);
  Future<int> setExposureCompensationIndex(int value);
  Future<void> setLinearZoom(double linearZoom);
  Future<void> setTorchStrengthLevel(int torchStrengthLevel);
  Future<void> setZoomRatio(double ratio);
  Future<FocusMeteringResultApi> startFocusAndMetering(
    FocusMeteringActionApi action,
  );
}
