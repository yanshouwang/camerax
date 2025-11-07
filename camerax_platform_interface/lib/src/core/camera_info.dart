import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'camera_selector.dart';
import 'camera_state.dart';
import 'dynamic_range.dart';
import 'exposure_state.dart';
import 'focus_metering_action.dart';
import 'low_light_boost_state.dart';
import 'torch_state.dart';
import 'zoom_state.dart';

abstract base class CameraInfo {
  static Future<bool> mustPlayShutterSound() =>
      CameraXPlugin.instance.$CameraInfo$MustPlayShutterSound();

  CameraInfo.impl();

  Future<CameraSelector> getCameraSelector();
  Future<CameraState?> getCameraState();
  Future<void> observeCameraState(Observer<CameraState> observer);
  Future<void> removeCameraStateObserver(Observer<CameraState> observer);
  Future<ExposureState> getExposureState();
  Future<double> getIntrinsicZoomRatio();
  Future<CameraSelectorLensFacing> getLensFacing();
  Future<LowLightBoostState?> getLowLightBoostState();
  Future<void> observeLowLightBoostState(Observer<LowLightBoostState> observer);
  Future<void> removeLowLightBoostStateObserver(
    Observer<LowLightBoostState> observer,
  );
  Future<int> getMaxTorchStrengthLevel();
  Future<Set<CameraInfo>> getPhysicalCameraInfos();
  Future<int> getSensorRotationDegrees([SurfaceRotation? relativeRotation]);
  Future<Set<Range<int>>> getSupportedFrameRateRanges();
  Future<TorchState?> getTorchState();
  Future<void> observeTorchState(Observer<TorchState> observer);
  Future<void> removeTorchStateObserver(Observer<TorchState> observer);
  Future<int?> getTorchStrengthLevel();
  Future<void> observeTorchStrengthLevel(Observer<int> observer);
  Future<void> removeTorchStrengthLevelObserver(Observer<int> observer);
  Future<ZoomState?> getZoomState();
  Future<void> observeZoomState(Observer<ZoomState> observer);
  Future<void> removeZoomStateObserver(Observer<ZoomState> observer);
  Future<bool> hasFlashUnit();
  Future<bool> isFocusMeteringSupported(FocusMeteringAction action);
  Future<bool> isLogicalMultiCameraSupported();
  Future<bool> isLowLightBoostSupported();
  Future<bool> isTorchStrengthSupported();
  Future<bool> isZslSupported();
  Future<Set<DynamicRange>> querySupportedDynamicRanges(
    Set<DynamicRange> candidateDynamicRanges,
  );
}
