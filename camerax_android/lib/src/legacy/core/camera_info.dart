import 'dart:async';

import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'camera_selector.dart';
import 'camera_state.dart';
import 'dynamic_range.dart';
import 'exposure_state.dart';
import 'focus_metering_action.dart';
import 'zoom_state.dart';

final class CameraInfo extends $base.CameraInfo {
  final $native.CameraInfo obj;

  late final StreamController<$base.CameraState> _cameraStateChangedController;
  late final StreamController<bool> _torchStateChangedController;
  late final StreamController<$base.ZoomState> _zoomStateChangedController;

  Future<$native.CameraStateObserver>? _cameraStateObserver;
  Future<$native.TorchStateObserver>? _torchStateObserver;
  Future<$native.ZoomStateObserver>? _zoomStateObserver;

  CameraInfo.$native(this.obj) : super.impl() {
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
  Stream<$base.CameraState> get cameraStateChanged =>
      _cameraStateChangedController.stream;
  @override
  Stream<bool> get torchStateChanged => _torchStateChangedController.stream;
  @override
  Stream<$base.ZoomState> get zoomStateChanged =>
      _zoomStateChangedController.stream;

  @override
  Future<$base.CameraSelector> getCameraSelector() async {
    final obj = await this.obj.getCameraSelector();
    return CameraSelector.$native(obj);
  }

  @override
  Future<$base.CameraState?> getCameraState() async {
    final dataObj = await this.obj.getCameraState();
    final obj = await dataObj.getValue();
    if (obj == null) {
      return null;
    }
    return obj.args;
  }

  @override
  Future<$base.ExposureState> getExposureState() async {
    final obj = await this.obj.getExposureState();
    return obj.args;
  }

  @override
  Future<double> getIntrinsicZoomRatio() async {
    final value = await obj.getIntrinsticZoomRatio();
    return value;
  }

  @override
  Future<$base.LensFacing> getLensFacing() async {
    final obj = await this.obj.getLensFacing();
    return obj.args;
  }

  @override
  Future<Set<$base.CameraInfo>> getPhysicalCameraInfos() async {
    final objs = await obj.getPhysicalCameraInfos();
    return objs.map((obj) => CameraInfo.$native(obj)).toSet();
  }

  @override
  Future<Set<$base.Range<int>>> getSupportedFrameRateRanges() async {
    final objs = await obj.getSupportedFrameRateRanges();
    return objs.map((obj) => obj.args).toSet();
  }

  @override
  Future<bool?> getTorchState() async {
    final dataObj = await obj.getTorchState();
    final value = await dataObj.getValue();
    return value == $native.TorchState.on;
  }

  @override
  Future<$base.ZoomState?> getZoomState() async {
    final dataObj = await this.obj.getZoomState();
    final obj = await dataObj.getValue();
    return obj?.args;
  }

  @override
  Future<bool> hasFlashUnit() async {
    final value = await obj.hasFlashUnit();
    return value;
  }

  @override
  Future<bool> isFocusMeteringSupported(
      $base.FocusMeteringAction action) async {
    if (action is! FocusMeteringAction) {
      throw TypeError();
    }
    final value = await obj.isFocusMeteringSupported(action.obj);
    return value;
  }

  @override
  Future<bool> isLogicalMultiCameraSupported() async {
    final value = await obj.isLogicalMultiCameraSupported();
    return value;
  }

  @override
  Future<bool> isZslSupported() async {
    final value = await obj.isZslSupported();
    return value;
  }

  @override
  Future<Set<$base.DynamicRange>> querySupportedDynamicRanges(
      Set<$base.DynamicRange> candidateDynamicRanges) async {
    final candidateDynamicRangeObjs =
        candidateDynamicRanges.map((range) => range.obj).toList();
    final rangeObjs =
        await obj.querySupportedDynamicRanges(candidateDynamicRangeObjs);
    return rangeObjs.map((obj) => obj.args).toSet();
  }

  void _onListenCameraStateChanged() async {
    final completer = Completer<$native.CameraStateObserver>();
    try {
      final observer = _cameraStateObserver;
      if (observer != null) {
        throw ArgumentError.value(observer);
      }
      _cameraStateObserver = completer.future;
      final dataObj = await obj.getCameraState();
      final observerObj = $native.CameraStateObserver(
        onChanged: (obj, valueObj) {
          _cameraStateChangedController.add(valueObj.args);
        },
      );
      await dataObj.observe(observerObj);
      completer.complete(observerObj);
    } catch (e) {
      completer.completeError(e);
      _cameraStateChangedController.addError(e);
    }
  }

  void _onCancelCameraStateChanged() async {
    try {
      final observer = _cameraStateObserver;
      if (observer == null) {
        throw ArgumentError.notNull();
      }
      _cameraStateObserver = null;
      final observerObj = await observer;
      final dataObj = await obj.getCameraState();
      await dataObj.removeObserver(observerObj);
    } catch (e) {
      _cameraStateChangedController.addError(e);
    }
  }

  void _onListenTorchStateChanged() async {
    final completer = Completer<$native.TorchStateObserver>();
    try {
      final observer = _torchStateObserver;
      if (observer != null) {
        throw ArgumentError.value(observer);
      }
      _torchStateObserver = completer.future;
      final dataObj = await obj.getTorchState();
      final observerObj = $native.TorchStateObserver(
        onChanged: (obj, value) {
          _torchStateChangedController.add(value == $native.TorchState.on);
        },
      );
      await dataObj.observe(observerObj);
      completer.complete(observerObj);
    } catch (e) {
      completer.completeError(e);
      _torchStateChangedController.addError(e);
    }
  }

  void _onCancelTorchStateChanged() async {
    try {
      final observer = _torchStateObserver;
      if (observer == null) {
        throw ArgumentError.notNull();
      }
      _torchStateObserver = null;
      final dataObj = await obj.getTorchState();
      final observerObj = await observer;
      await dataObj.removeObserver(observerObj);
    } catch (e) {
      _torchStateChangedController.addError(e);
    }
  }

  void _onListenZoomStateChanged() async {
    final completer = Completer<$native.ZoomStateObserver>();
    try {
      final observer = _zoomStateObserver;
      if (observer != null) {
        throw ArgumentError.value(observer);
      }
      _zoomStateObserver = completer.future;
      final dataObj = await obj.getZoomState();
      final observerObj = $native.ZoomStateObserver(
        onChanged: (obj, valueObj) {
          try {
            _zoomStateChangedController.add(valueObj.args);
          } catch (e) {
            _zoomStateChangedController.addError(e);
          }
        },
      );
      await dataObj.observe(observerObj);
      completer.complete(observerObj);
    } catch (e) {
      completer.completeError(e);
      _zoomStateChangedController.addError(e);
    }
  }

  void _onCancelZoomStateChanged() async {
    try {
      final observer = _zoomStateObserver;
      if (observer == null) {
        throw ArgumentError.notNull();
      }
      _zoomStateObserver = null;
      final dataObj = await obj.getZoomState();
      final observerObj = await observer;
      await dataObj.removeObserver(observerObj);
    } catch (e) {
      _zoomStateChangedController.addError(e);
    }
  }
}
