import 'dart:async';

import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraInfoImpl implements CameraInfo {
  final CameraInfoProxyApi api;

  CameraInfoImpl.internal(this.api);

  @override
  Future<CameraSelector> getCameraSelector() =>
      api.getCameraSelector().then((e) => e.impl);

  @override
  Future<CameraState?> getCameraState() =>
      api.getCameraState().then((e) => e?.impl);

  @override
  Future<ExposureState> getExposureState() => throw UnimplementedError();

  @override
  Future<double> getIntrinsicZoomRatio() => api.getIntrinsicZoomRatio();

  @override
  Future<CameraSelector$LensFacing> getLensFacing() =>
      api.getLensFacing().then((e) => e.impl);

  @override
  Future<Set<CameraInfo>> getPhysicalCameraInfos() =>
      api.getPhysicalCameraInfos().then((e) => e.map((e1) => e1.impl).toSet());

  @override
  Future<Set<Range<int>>> getSupportedFrameRateRanges() =>
      throw UnimplementedError();

  @override
  Future<TorchState?> getTorchState() =>
      api.getTorchState().then((e) => e?.impl);

  @override
  Future<ZoomState?> getZoomState() => api.getZoomState().then((e) => e?.impl);

  @override
  Future<bool> hasFlashUnit() => api.hasFlashUnit();

  @override
  Future<bool> isFocusMeteringSupported(FocusMeteringAction action) =>
      api.isFocusMeteringSupported(action.api);

  @override
  Future<bool> isLogicalMultiCameraSupported() =>
      api.isLogicalMultiCameraSupported();

  @override
  Future<bool> isZslSupported() => api.isZslSupported();

  @override
  Future<Set<DynamicRange>> querySupportedDynamicRanges(
    Set<DynamicRange> candidateDynamicRanges,
  ) => throw UnimplementedError();

  @override
  Future<void> observeCameraState(Observer<CameraState> observer) =>
      api.observeCameraState(observer.api);

  @override
  Future<void> observeTorchState(Observer<TorchState> observer) =>
      api.observeTorchState(observer.api);

  @override
  Future<void> observeZoomState(Observer<ZoomState> observer) =>
      api.observeZoomState(observer.api);

  @override
  Future<void> removeCameraStateObserver(Observer<CameraState> observer) =>
      api.removeCameraStateObserver(observer.api);

  @override
  Future<void> removeTorchStateObserver(Observer<TorchState> observer) =>
      api.removeTorchStateObserver(observer.api);

  @override
  Future<void> removeZoomStateObserver(Observer<ZoomState> observer) =>
      api.removeZoomStateObserver(observer.api);

  @override
  Future<LowLightBoostState?> getLowLightBoostState() =>
      throw UnimplementedError();

  @override
  Future<int> getMaxTorchStrengthLevel() => throw UnimplementedError();

  @override
  Future<int> getSensorRotationDegrees([Surface$Rotation? relativeRotation]) =>
      relativeRotation == null
      ? api.getSensorRotationDegrees1()
      : api.getSensorRotationDegrees2(relativeRotation.api);

  @override
  Future<int?> getTorchStrengthLevel() => throw UnimplementedError();

  @override
  Future<bool> isLowLightBoostSupported() => api.isLowLightBoostSupported();

  @override
  Future<bool> isTorchStrengthSupported() => api.isTorchStrengthSupported();

  @override
  Future<void> observeLowLightBoostState(
    Observer<LowLightBoostState> observer,
  ) => throw UnimplementedError();

  @override
  Future<void> observeTorchStrengthLevel(Observer<int> observer) =>
      throw UnimplementedError();

  @override
  Future<void> removeLowLightBoostStateObserver(
    Observer<LowLightBoostState> observer,
  ) => throw UnimplementedError();

  @override
  Future<void> removeTorchStrengthLevelObserver(Observer<int> observer) =>
      throw UnimplementedError();
}

final class CameraInfoChannelImpl extends CameraInfoChannel {
  @override
  Future<bool> mustPlayShutterSound() =>
      CameraInfoProxyApi.mustPlayShutterSound();
}

extension CameraInfoX on CameraInfo {
  CameraInfoProxyApi get api {
    final impl = this;
    if (impl is! CameraInfoImpl) throw TypeError();
    return impl.api;
  }
}

extension CameraInfoProxyApiX on CameraInfoProxyApi {
  CameraInfo get impl => CameraInfoImpl.internal(this);
}
