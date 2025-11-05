import 'dart:async';

import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera_selector_impl.dart';
import 'camera_state_impl.dart';
import 'dynamic_range_impl.dart';
import 'exposure_state_impl.dart';
import 'focus_metering_action_impl.dart';
import 'torch_state_impl.dart';
import 'zoom_state_impl.dart';

final class CameraInfoImpl extends CameraInfo {
  final CameraInfoProxyApi api;

  CameraInfoImpl.internal(this.api) : super.impl();

  @override
  Future<CameraSelector> getCameraSelector() =>
      api.getCameraSelector().then((e) => e.impl);

  @override
  Future<CameraState?> getCameraState() =>
      api.getCameraState().then((e) => e?.impl);

  @override
  Future<ExposureState> getExposureState() =>
      api.getExposureState().then((e) => e.impl);

  @override
  Future<double> getIntrinsicZoomRatio() => api.getIntrinsticZoomRatio();

  @override
  Future<CameraSelectorLensFacing> getLensFacing() =>
      api.getLensFacing().then((e) => e.impl);

  @override
  Future<Set<CameraInfo>> getPhysicalCameraInfos() =>
      api.getPhysicalCameraInfos().then((e) => e.map((e1) => e1.impl).toSet());

  @override
  Future<Set<RangeApi>> getSupportedFrameRateRanges() => api
      .getSupportedFrameRateRanges()
      .then((e) => e.map((e1) => e1.impl).toSet());

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
  ) => api
      .querySupportedDynamicRanges(
        candidateDynamicRanges.map((e) => e.api).toList(),
      )
      .then((e) => e.map((e1) => e1.impl).toSet());

  @override
  Future<void> observeCameraState(CameraStateObserverApi observer) =>
      api.observeCameraState(observer.api);

  @override
  Future<void> observeTorchState(TorchStateObserverApi observer) =>
      api.observeTorchState(observer.api);

  @override
  Future<void> observeZoomState(ZoomStateObserverApi observer) =>
      api.observeZoomState(observer.api);

  @override
  Future<void> removeCameraStateObserver(CameraStateObserverApi observer) =>
      api.removeCameraStateObserver(observer.api);

  @override
  Future<void> removeTorchStateObserver(TorchStateObserverApi observer) =>
      api.removeTorchStateObserver(observer.api);

  @override
  Future<void> removeZoomStateObserver(ZoomStateObserverApi observer) =>
      api.removeZoomStateObserver(observer.api);
}

extension CameraInfoApiX on CameraInfo {
  CameraInfoProxyApi get api {
    final impl = this;
    if (impl is! CameraInfoImpl) throw TypeError();
    return impl.api;
  }
}

extension CameraInfoProxyApiX on CameraInfoProxyApi {
  CameraInfo get impl => CameraInfoImpl.internal(this);
}
