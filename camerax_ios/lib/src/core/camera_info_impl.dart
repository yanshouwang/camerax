import 'dart:async';

import 'package:camerax_ios/src/camerax.g.dart';
// import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera_selector_impl.dart';
import 'camera_state_impl.dart';
// import 'dynamic_range_impl.dart';
// import 'exposure_state_impl.dart';
import 'focus_metering_action_impl.dart';
import 'lens_facing_impl.dart';
import 'torch_state_impl.dart';
import 'zoom_state_impl.dart';

final class CameraInfoImpl extends CameraInfoChannel {
  final CameraInfoApi api;

  late final CameraStateObserverApi _cameraStateObserverApi;
  late final TorchStateObserverApi _torchStateObserverApi;
  late final ZoomStateObserverApi _zoomStateObserverApi;
  late final StreamController<CameraState> _cameraStateChangedController;
  late final StreamController<TorchState> _torchStateChangedController;
  late final StreamController<ZoomState> _zoomStateChangedController;

  Future<NSKeyValueObservationApi>? _cameraStateObservationApiFuture;
  Future<NSKeyValueObservationApi>? _torchStateObservationApiFuture;
  Future<NSKeyValueObservationApi>? _zoomStateObservationApiFuture;

  CameraInfoImpl.impl(this.api) : super.impl() {
    _cameraStateObserverApi = CameraStateObserverApi(
      onChanged: (_, e) => _cameraStateChangedController.add(e.impl),
    );
    _torchStateObserverApi = TorchStateObserverApi(
      onChanged: (_, e) => _torchStateChangedController.add(e.impl),
    );
    _zoomStateObserverApi = ZoomStateObserverApi(
      onChanged: (_, e) => _zoomStateChangedController.add(e.impl),
    );
    _cameraStateChangedController = StreamController.broadcast(
      onListen: () async {
        try {
          var future = _cameraStateObservationApiFuture;
          if (future != null) {
            throw ArgumentError.value(future);
          }
          final observerApi = _cameraStateObserverApi;
          _cameraStateObservationApiFuture =
              future = api.observeCameraState(observerApi);
          await future;
        } catch (e) {
          _cameraStateChangedController.addError(e);
        }
      },
      onCancel: () async {
        try {
          final future =
              ArgumentError.checkNotNull(_cameraStateObservationApiFuture);
          _cameraStateObservationApiFuture = null;
          final observationApi = await future;
          await observationApi.invalidate();
        } catch (e) {
          _cameraStateChangedController.addError(e);
        }
      },
    );
    _torchStateChangedController = StreamController.broadcast(
      onListen: () async {
        try {
          var future = _torchStateObservationApiFuture;
          if (future != null) {
            throw ArgumentError.value(future);
          }
          final observerApi = _torchStateObserverApi;
          _torchStateObservationApiFuture =
              future = api.observeTorchState(observerApi);
          await future;
        } catch (e) {
          _torchStateChangedController.addError(e);
        }
      },
      onCancel: () async {
        try {
          final future =
              ArgumentError.checkNotNull(_torchStateObservationApiFuture);
          _torchStateObservationApiFuture = null;
          final observationApi = await future;
          await observationApi.invalidate();
        } catch (e) {
          _torchStateChangedController.addError(e);
        }
      },
    );
    _zoomStateChangedController = StreamController.broadcast(
      onListen: () async {
        try {
          var future = _zoomStateObservationApiFuture;
          if (future != null) {
            throw ArgumentError.value(future);
          }
          final observerApi = _zoomStateObserverApi;
          _zoomStateObservationApiFuture =
              future = api.observeZoomState(observerApi);
          await future;
        } catch (e) {
          _zoomStateChangedController.addError(e);
        }
      },
      onCancel: () async {
        try {
          final future =
              ArgumentError.checkNotNull(_zoomStateObservationApiFuture);
          _zoomStateObservationApiFuture = null;
          final observerationApi = await future;
          await observerationApi.invalidate();
        } catch (e) {
          _zoomStateChangedController.addError(e);
        }
      },
    );
  }

  @override
  Stream<CameraState> get cameraStateChanged =>
      _cameraStateChangedController.stream;
  @override
  Stream<TorchState> get torchStateChanged =>
      _torchStateChangedController.stream;
  @override
  Stream<ZoomState> get zoomStateChanged => _zoomStateChangedController.stream;

  @override
  Future<CameraSelector> getCameraSelector() =>
      api.getCameraSelector().then((e) => e.impl);

  @override
  Future<CameraState?> getCameraState() =>
      api.getCameraState().then((e) => e?.impl);

  @override
  Future<ExposureState> getExposureState() => throw UnimplementedError();
  // api.getExposureState().then((e) => e.impl);

  @override
  Future<double> getIntrinsicZoomRatio() => api.getIntrinsticZoomRatio();

  @override
  Future<LensFacing> getLensFacing() => api.getLensFacing().then((e) => e.impl);

  @override
  Future<Set<CameraInfo>> getPhysicalCameraInfos() => api
      .getPhysicalCameraInfos()
      .then((e1) => e1.map((e2) => e2.impl).toSet());

  @override
  Future<Set<Range<int>>> getSupportedFrameRateRanges() =>
      throw UnimplementedError();
  //  api
  //     .getSupportedFrameRateRanges()
  //     .then((e1) => e1.map((e2) => e2.impl).toSet());

  @override
  Future<TorchState?> getTorchState() =>
      api.getTorchState().then((e) => e?.impl);

  @override
  Future<ZoomState?> getZoomState() => api.getZoomState().then((e) => e?.impl);

  @override
  Future<bool> hasFlashUnit() => api.hasFlashUnit();

  @override
  Future<bool> isFocusMeteringSupported(FocusMeteringAction action) {
    if (action is! FocusMeteringActionImpl) {
      throw TypeError();
    }
    return api.isFocusMeteringSupported(action.api);
  }

  @override
  Future<bool> isLogicalMultiCameraSupported() =>
      api.isLogicalMultiCameraSupported();

  @override
  Future<bool> isZslSupported() => api.isZslSupported();

  @override
  Future<Set<DynamicRange>> querySupportedDynamicRanges(
      Set<DynamicRange> candidateDynamicRanges) {
    throw UnimplementedError();
    // final candidateDynamicRangeApis =
    //     candidateDynamicRanges.map((e) => e.api).toList();
    // return api
    //     .querySupportedDynamicRanges(candidateDynamicRangeApis)
    //     .then((e1) => e1.map((e2) => e2.impl).toSet());
  }
}

extension CameraInfoApiX on CameraInfoApi {
  CameraInfo get impl => CameraInfoImpl.impl(this);
}
