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
  Future<LiveData<CameraState>> getCameraState() =>
      api.getCameraState().then((e) => e.impl);

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
  Future<LiveData<TorchState>> getTorchState() =>
      api.getTorchState().then((e) => e.impl);

  @override
  Future<LiveData<ZoomState>> getZoomState() =>
      api.getZoomState().then((e) => e.impl);

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
  Future<LiveData<LowLightBoostState>> getLowLightBoostState() =>
      throw UnimplementedError();

  @override
  Future<int> getMaxTorchStrengthLevel() => throw UnimplementedError();

  @override
  Future<int> getSensorRotationDegrees([Surface$Rotation? relativeRotation]) =>
      relativeRotation == null
      ? api.getSensorRotationDegrees1()
      : api.getSensorRotationDegrees2(relativeRotation.api);

  @override
  Future<LiveData<int>> getTorchStrengthLevel() => throw UnimplementedError();

  @override
  Future<bool> isLowLightBoostSupported() => api.isLowLightBoostSupported();

  @override
  Future<bool> isTorchStrengthSupported() => api.isTorchStrengthSupported();
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
