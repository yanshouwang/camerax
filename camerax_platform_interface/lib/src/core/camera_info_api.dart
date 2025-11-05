import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'camera_selector_api.dart';
import 'camera_state_api.dart';
import 'dynamic_range_api.dart';
import 'exposure_state_api.dart';
import 'focus_metering_action_api.dart';
import 'low_light_boost_state_api.dart';
import 'torch_state_api.dart';
import 'zoom_state_api.dart';

abstract base class CameraInfoApi {
  static Future<bool> mustPlayShutterSound() =>
      CameraXPlugin.instance.$CameraInfoApiMustPlayShutterSound();

  CameraInfoApi.impl();

  Future<CameraSelectorApi> getCameraSelector();
  Future<CameraState?> getCameraState();
  Future<void> observeCameraState(CameraStateObserverApi observer);
  Future<void> removeCameraStateObserver(CameraStateObserverApi observer);
  Future<ExposureStateApi> getExposureState();
  Future<double> getIntrinsicZoomRatio();
  Future<CameraSelectorLensFacing> getLensFacing();
  Future<LowLightBoostState> getLowLightBoostState();
  Future<void> observeLowLightBoostState(
    LowLightBoostStateObserverApi observer,
  );
  Future<void> removeLowLightBoostStateObserver(
    LowLightBoostStateObserverApi observer,
  );
  Future<int> getMaxTorchStrengthLevel();
  Future<Set<CameraInfoApi>> getPhysicalCameraInfos();
  Future<int> getSensorRotationDegrees1();
  Future<int> getSensorRotationDegrees2(SurfaceRotation relativeRatation);
  Future<Set<RangeApi>> getSupportedFrameRateRanges();
  Future<TorchState?> getTorchState();
  Future<void> observeTorchState(TorchStateObserverApi observer);
  Future<void> removeTorchStateObserver(TorchStateObserverApi observer);
  Future<int> getTorchStrengthLevel();
  Future<void> observeTorchStrengthLevel(IntObserverApi observer);
  Future<void> removeTorchStrengthLevelObserver(IntObserverApi observer);
  Future<ZoomStateApi?> getZoomState();
  Future<void> observeZoomState(ZoomStateObserverApi observer);
  Future<void> removeZoomStateObserver(ZoomStateObserverApi observer);
  Future<bool> hasFlashUnit();
  Future<bool> isFocusMeteringSupported(FocusMeteringActionApi action);
  Future<bool> isLogicalMultiCameraSupported();
  bool isLowLightBoostSupported();
  bool isTorchStrengthSupported();
  Future<bool> isZslSupported();
  Future<Set<DynamicRangeApi>> querySupportedDynamicRanges(
    Set<DynamicRangeApi> candidateDynamicRanges,
  );
}
