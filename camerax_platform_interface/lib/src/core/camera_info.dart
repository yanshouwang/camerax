import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class CameraInfo {
  static Future<bool> mustPlayShutterSound() =>
      CameraInfoChannel.instance.mustPlayShutterSound();

  Future<CameraSelector> getCameraSelector();
  Future<CameraState?> getCameraState();
  Future<void> observeCameraState(Observer<CameraState> observer);
  Future<void> removeCameraStateObserver(Observer<CameraState> observer);
  Future<ExposureState> getExposureState();
  Future<double> getIntrinsicZoomRatio();
  Future<CameraSelector$LensFacing> getLensFacing();
  Future<LowLightBoostState?> getLowLightBoostState();
  Future<void> observeLowLightBoostState(Observer<LowLightBoostState> observer);
  Future<void> removeLowLightBoostStateObserver(
    Observer<LowLightBoostState> observer,
  );
  Future<int> getMaxTorchStrengthLevel();
  Future<Set<CameraInfo>> getPhysicalCameraInfos();
  Future<int> getSensorRotationDegrees([Surface$Rotation? relativeRotation]);
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

abstract base class CameraInfoChannel extends PlatformInterface {
  CameraInfoChannel() : super(token: _token);

  static final _token = Object();

  static CameraInfoChannel? _instance;

  static CameraInfoChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(CameraInfoChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<bool> mustPlayShutterSound();
}
