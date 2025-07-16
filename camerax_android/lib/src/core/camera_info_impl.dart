import 'dart:async';

import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera_selector_impl.dart';
import 'camera_state_impl.dart';
import 'dynamic_range_impl.dart';
import 'exposure_state_impl.dart';
import 'focus_metering_action_impl.dart';
import 'lens_facing_impl.dart';
import 'torch_state_impl.dart';
import 'zoom_state_impl.dart';

final class CameraInfoImpl extends CameraInfo {
  final CameraInfoApi api;

  late final StreamController<CameraState> _cameraStateChangedController;
  late final StreamController<TorchState> _torchStateChangedController;
  late final StreamController<ZoomState> _zoomStateChangedController;

  Future<CameraStateObserverApi>? _cameraStateObserverApiFuture;
  Future<TorchStateObserverApi>? _torchStateObserverApiFuture;
  Future<ZoomStateObserverApi>? _zoomStateObserverApiFuture;

  CameraInfoImpl.internal(this.api) : super.impl() {
    _cameraStateChangedController = StreamController.broadcast(
      onListen: _onListenCameraStateChanged,
      onCancel: _onCancelCameraStateChanged,
    );
    _torchStateChangedController = StreamController.broadcast(
      onListen: _onListenTorchStateChanged,
      onCancel: _onCancelTorchStateChanged,
    );
    _zoomStateChangedController = StreamController.broadcast(
      onListen: _onListenZoomStateChanged,
      onCancel: _onCancelZoomStateChanged,
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
      api.getCameraState().then((e) => e.getValue()).then((e) => e?.impl);

  @override
  Future<ExposureState> getExposureState() =>
      api.getExposureState().then((e) => e.impl);

  @override
  Future<double> getIntrinsicZoomRatio() => api.getIntrinsticZoomRatio();

  @override
  Future<LensFacing> getLensFacing() => api.getLensFacing().then((e) => e.impl);

  @override
  Future<Set<CameraInfo>> getPhysicalCameraInfos() => api
      .getPhysicalCameraInfos()
      .then((e1) => e1.map((e2) => e2.impl).toSet());

  @override
  Future<Set<Range<int>>> getSupportedFrameRateRanges() => api
      .getSupportedFrameRateRanges()
      .then((e1) => e1.map((e2) => e2.impl).toSet());

  @override
  Future<TorchState?> getTorchState() =>
      api.getTorchState().then((e) => e.getValue()).then((e) => e?.impl);

  @override
  Future<ZoomState?> getZoomState() =>
      api.getZoomState().then((e) => e.getValue()).then((e) => e?.impl);

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
    final candidateDynamicRangeApis =
        candidateDynamicRanges.map((e) => e.api).toList();
    return api
        .querySupportedDynamicRanges(candidateDynamicRangeApis)
        .then((e1) => e1.map((e2) => e2.impl).toSet());
  }

  void _onListenCameraStateChanged() async {
    final completer = Completer<CameraStateObserverApi>();
    try {
      final future = _cameraStateObserverApiFuture;
      if (future != null) {
        throw ArgumentError.value(future);
      }
      _cameraStateObserverApiFuture = completer.future;
      final liveDataApi = await api.getCameraState();
      final observerApi = CameraStateObserverApi(
        onChanged: (_, e) {
          _cameraStateChangedController.add(e.impl);
        },
      );
      await liveDataApi.observe(observerApi);
      completer.complete(observerApi);
    } catch (e) {
      completer.completeError(e);
      _cameraStateChangedController.addError(e);
    }
  }

  void _onCancelCameraStateChanged() async {
    try {
      final future = ArgumentError.checkNotNull(_cameraStateObserverApiFuture);
      _cameraStateObserverApiFuture = null;
      final liveDataApi = await api.getCameraState();
      final observerApi = await future;
      await liveDataApi.removeObserver(observerApi);
    } catch (e) {
      _cameraStateChangedController.addError(e);
    }
  }

  void _onListenTorchStateChanged() async {
    final completer = Completer<TorchStateObserverApi>();
    try {
      final future = _torchStateObserverApiFuture;
      if (future != null) {
        throw ArgumentError.value(future);
      }
      _torchStateObserverApiFuture = completer.future;
      final liveDataApi = await api.getTorchState();
      final observerApi = TorchStateObserverApi(
        onChanged: (_, e) {
          _torchStateChangedController.add(e.impl);
        },
      );
      await liveDataApi.observe(observerApi);
      completer.complete(observerApi);
    } catch (e) {
      completer.completeError(e);
      _torchStateChangedController.addError(e);
    }
  }

  void _onCancelTorchStateChanged() async {
    try {
      final future = ArgumentError.checkNotNull(_torchStateObserverApiFuture);
      _torchStateObserverApiFuture = null;
      final liveDataApi = await api.getTorchState();
      final observerApi = await future;
      await liveDataApi.removeObserver(observerApi);
    } catch (e) {
      _torchStateChangedController.addError(e);
    }
  }

  void _onListenZoomStateChanged() async {
    final completer = Completer<ZoomStateObserverApi>();
    try {
      final future = _zoomStateObserverApiFuture;
      if (future != null) {
        throw ArgumentError.value(future);
      }
      _zoomStateObserverApiFuture = completer.future;
      final liveDataApi = await api.getZoomState();
      final observerApi = ZoomStateObserverApi(
        onChanged: (_, e) {
          try {
            _zoomStateChangedController.add(e.impl);
          } catch (e) {
            _zoomStateChangedController.addError(e);
          }
        },
      );
      await liveDataApi.observe(observerApi);
      completer.complete(observerApi);
    } catch (e) {
      completer.completeError(e);
      _zoomStateChangedController.addError(e);
    }
  }

  void _onCancelZoomStateChanged() async {
    try {
      final future = ArgumentError.checkNotNull(_zoomStateObserverApiFuture);
      _zoomStateObserverApiFuture = null;
      final liveDataApi = await api.getZoomState();
      final observerApi = await future;
      await liveDataApi.removeObserver(observerApi);
    } catch (e) {
      _zoomStateChangedController.addError(e);
    }
  }
}

extension CameraInfoApiX on CameraInfoApi {
  CameraInfo get impl => CameraInfoImpl.internal(this);
}
