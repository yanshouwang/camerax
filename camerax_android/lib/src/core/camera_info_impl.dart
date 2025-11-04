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

final class CameraInfoImpl extends CameraInfoApi {
  final CameraInfoProxyApi api;

  CameraInfoImpl.internal(this.api) : super.impl();

  @override
  Future<CameraSelectorApi> getCameraSelector() =>
      api.getCameraSelector().then((e) => e.impl);

  @override
  Future<CameraState?> getCameraState() =>
      api.getCameraState().then((e) => e?.impl);

  @override
  Future<ExposureStateApi> getExposureState() =>
      api.getExposureState().then((e) => e.impl);

  @override
  Future<double> getIntrinsicZoomRatio() => api.getIntrinsticZoomRatio();

  @override
  Future<CameraSelectorLensFacing> getLensFacing() =>
      api.getLensFacing().then((e) => e.impl);

  @override
  Future<Set<CameraInfoApi>> getPhysicalCameraInfos() =>
      api.getPhysicalCameraInfos().then((e) => e.map((e1) => e1.impl).toSet());

  @override
  Future<Set<Range<int>>> getSupportedFrameRateRanges() => api
      .getSupportedFrameRateRanges()
      .then((e) => e.map((e1) => e1.impl).toSet());

  @override
  Future<TorchState?> getTorchState() =>
      api.getTorchState().then((e) => e?.impl);

  @override
  Future<ZoomStateApi?> getZoomState() =>
      api.getZoomState().then((e) => e?.impl);

  @override
  Future<bool> hasFlashUnit() => api.hasFlashUnit();

  @override
  Future<bool> isFocusMeteringSupported(FocusMeteringActionApi action) =>
      api.isFocusMeteringSupported(action.api);

  @override
  Future<bool> isLogicalMultiCameraSupported() =>
      api.isLogicalMultiCameraSupported();

  @override
  Future<bool> isZslSupported() => api.isZslSupported();

  @override
  Future<Set<DynamicRangeApi>> querySupportedDynamicRanges(
    Set<DynamicRangeApi> candidateDynamicRanges,
  ) => api
      .querySupportedDynamicRanges(
        candidateDynamicRanges.map((e) => e.api).toList(),
      )
      .then((e) => e.map((e1) => e1.impl).toSet());

  @override
  Future<void> observeCameraState(ObserverApi<CameraState> observer) =>
      api.observeCameraState(observer.cameraStateObserverApi);

  @override
  Future<void> observeTorchState(ObserverApi<TorchState> observer) =>
      api.observeTorchState(observer.torchStateObserverApi);

  @override
  Future<void> observeZoomState(ObserverApi<ZoomStateApi> observer) =>
      api.observeZoomState(observer.zoomStateObserverApi);

  @override
  Future<void> removeCameraStateObserver(ObserverApi<CameraState> observer) =>
      api.removeCameraStateObserver(observer.cameraStateObserverApi);

  @override
  Future<void> removeTorchStateObserver(ObserverApi<TorchState> observer) =>
      api.removeTorchStateObserver(observer.torchStateObserverApi);

  @override
  Future<void> removeZoomStateObserver(ObserverApi<ZoomStateApi> observer) =>
      api.removeZoomStateObserver(observer.zoomStateObserverApi);
}

extension CameraInfoApiX on CameraInfoApi {
  CameraInfoProxyApi get api {
    final impl = this;
    if (impl is! CameraInfoImpl) throw TypeError();
    return impl.api;
  }
}

extension CameraInfoProxyApiX on CameraInfoProxyApi {
  CameraInfoApi get impl => CameraInfoImpl.internal(this);
}
