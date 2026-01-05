import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class CameraInfo {
  static Future<bool> mustPlayShutterSound() =>
      CameraInfoChannel.instance.mustPlayShutterSound();

  Future<CameraSelector> getCameraSelector();
  Future<LiveData<CameraState>> getCameraState();
  Future<ExposureState> getExposureState();
  Future<double> getIntrinsicZoomRatio();
  Future<CameraSelector$LensFacing> getLensFacing();
  Future<LiveData<LowLightBoostState>> getLowLightBoostState();
  Future<int> getMaxTorchStrengthLevel();
  Future<Set<CameraInfo>> getPhysicalCameraInfos();
  Future<int> getSensorRotationDegrees([Surface$Rotation? relativeRotation]);
  Future<Set<Range<int>>> getSupportedFrameRateRanges();
  Future<LiveData<TorchState>> getTorchState();
  Future<LiveData<int>> getTorchStrengthLevel();
  Future<LiveData<ZoomState>> getZoomState();
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
