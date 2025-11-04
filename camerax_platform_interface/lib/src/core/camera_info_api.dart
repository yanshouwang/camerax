import 'package:camerax_platform_interface/src/common.dart';

import 'camera_selector_api.dart';
import 'camera_state_api.dart';
import 'dynamic_range_api.dart';
import 'exposure_state_api.dart';
import 'focus_metering_action_api.dart';
import 'torch_state_api.dart';
import 'zoom_state_api.dart';

abstract base class CameraInfoApi {
  CameraInfoApi.impl();

  Future<CameraSelectorApi> getCameraSelector();
  Future<CameraState?> getCameraState();
  Future<void> observeCameraState(CameraStateObserverApi observer);
  Future<void> removeCameraStateObserver(CameraStateObserverApi observer);
  Future<TorchState?> getTorchState();
  Future<void> observeTorchState(TorchStateObserverApi observer);
  Future<void> removeTorchStateObserver(TorchStateObserverApi observer);
  Future<ZoomStateApi?> getZoomState();
  Future<void> observeZoomState(ZoomStateObserverApi observer);
  Future<void> removeZoomStateObserver(ZoomStateObserverApi observer);
  Future<ExposureStateApi> getExposureState();
  Future<double> getIntrinsicZoomRatio();
  Future<CameraSelectorLensFacing> getLensFacing();
  Future<Set<CameraInfoApi>> getPhysicalCameraInfos();
  Future<Set<RangeApi>> getSupportedFrameRateRanges();
  Future<bool> hasFlashUnit();
  Future<bool> isFocusMeteringSupported(FocusMeteringActionApi action);
  Future<bool> isLogicalMultiCameraSupported();
  Future<bool> isZslSupported();
  Future<Set<DynamicRangeApi>> querySupportedDynamicRanges(
    Set<DynamicRangeApi> candidateDynamicRanges,
  );
}
