import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:ffi/ffi.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:objective_c/objective_c.dart';

import 'ffi.dart';
import 'ffi.g.dart' as ffi;

final class CameraControllerImpl
    with TypeLogger, LoggerController
    implements CameraController {
  final ffi.CameraController ffiValue;
  late final StreamController<ZoomState?> _zoomStateChagnedController;
  late final StreamController<bool?> _torchStateChagnedController;

  CameraControllerImpl() : ffiValue = ffi.CameraController.alloc().init() {
    _zoomStateChagnedController = StreamController.broadcast(
      onListen: _addZoomStateObserver,
      onCancel: _removeZoomStateObserver,
    );
    _torchStateChagnedController = StreamController.broadcast(
      onListen: _addTorchStateObserver,
      onCancel: _removeTorchStateObserver,
    );
  }

  @override
  Stream<ZoomState?> get zoomStateChanged => _zoomStateChagnedController.stream;
  @override
  Stream<bool?> get torchStateChanged => _torchStateChagnedController.stream;

  @override
  Future<bool> requestPermissions({bool enableAudio = false}) async {
    final completer = Completer<bool>();
    final handler = ffi.ObjCBlock_ffiVoid_bool.listener((granted) {
      completer.complete(granted);
    });
    ffiValue.requestPermissionsWithEnableAudio_completionHandler_(
      enableAudio,
      handler,
    );
    final granted = await completer.future;
    return granted;
  }

  @override
  Future<void> bindToLifecycle() async {
    ffiValue.bindToLifecycle();
  }

  @override
  Future<void> unbind() async {
    ffiValue.unbind();
  }

  @override
  Future<bool> hasCamera(CameraSelector cameraSelector) async {
    final hasCamera =
        ffiValue.hasCameraWithCameraSelector_(cameraSelector.ffiValue);
    return hasCamera;
  }

  @override
  Future<void> setCameraSelector(CameraSelector cameraSelector) async {
    logger.info('setCameraController $cameraSelector');
    final error = using((arena) {
      final errorPtr = arena<Pointer<ObjCObject>>();
      return ffiValue.setCameraSelector_error_(
              cameraSelector.ffiValue, errorPtr)
          ? null
          : NSError.castFromPointer(errorPtr.value);
    });
    if (error == null) {
      return;
    }
    throw error;
  }

  @override
  Future<bool> isTapToFocusEnabled() async {
    final enabled = ffiValue.isTapToFocusEnabled();
    return enabled;
  }

  @override
  Future<void> setTapToFocusEnabled(bool enabled) async {
    ffiValue.setTapToFocusEnabled_(enabled);
  }

  @override
  Future<bool> isPinchToZoomEnabled() async {
    final enabled = ffiValue.isPinchToZoomEnabled();
    return enabled;
  }

  @override
  Future<void> setPinchToZoomEnabled(bool enabled) async {
    ffiValue.setPinchToZoomEnabled_(enabled);
  }

  @override
  Future<ZoomState?> getZoomState() async {
    final zoomState = ffiValue.getZoomState()?.dartValue;
    return zoomState;
  }

  @override
  Future<void> setZoomRatio(double zoomRatio) async {
    final error = using((arena) {
      final errorPtr = arena<Pointer<ObjCObject>>();
      return ffiValue.setZoomRatio_error_(zoomRatio, errorPtr)
          ? null
          : NSError.castFromPointer(errorPtr.value);
    });
    if (error == null) {
      return;
    }
    throw error;
  }

  @override
  Future<void> setLinearZoom(double linearZoom) async {
    final error = using((arena) {
      final errorPtr = arena<Pointer<ObjCObject>>();
      return ffiValue.setLinearZoom_error_(linearZoom, errorPtr)
          ? null
          : NSError.castFromPointer(errorPtr.value);
    });
    if (error == null) {
      return;
    }
    throw error;
  }

  @override
  Future<bool?> getTorchState() async {
    final torchState = ffiValue.getTorchState();
    return torchState?.value;
  }

  @override
  Future<void> enableTorch(bool torchEnabled) async {
    final error = using((arena) {
      final errorPtr = arena<Pointer<ObjCObject>>();
      return ffiValue.enableTorch_error_(torchEnabled, errorPtr)
          ? null
          : NSError.castFromPointer(errorPtr.value);
    });
    if (error == null) {
      return;
    }
    throw error;
  }

  @override
  Future<void> setImageAnalyzer(ImageAnalyzer analyzer) {
    // TODO: implement setImageAnalyzer
    throw UnimplementedError();
  }

  @override
  Future<void> clearImageAnalyzer() {
    // TODO: implement clearImageAnalyzer
    throw UnimplementedError();
  }

  @override
  Future<FlashMode> getImageCaptureFlashMode() async {
    final flashMode = ffiValue.imageCaptureFlashMode;
    switch (flashMode) {
      case ffi.FlashMode.FlashModeAuto:
        return FlashMode.auto;
      case ffi.FlashMode.FlashModeOn:
        return FlashMode.on;
      case ffi.FlashMode.FlashModeOff:
        return FlashMode.off;
      default:
        throw ArgumentError.value(flashMode);
    }
  }

  @override
  Future<void> setImageCaptureFlashMode(FlashMode flashMode) async {
    ffiValue.imageCaptureFlashMode = flashMode.ffiValue;
  }

  @override
  Future<Uint8List> takePictureToMemory() {
    // TODO: implement takePictureToMemory
    throw UnimplementedError();
  }

  @override
  Future<Uri> takePictureToAlbum({String? name}) {
    // TODO: implement takePictureToAlbum
    throw UnimplementedError();
  }

  void _addZoomStateObserver() {
    final callback = ffi.ObjCBlock_ffiVoid_ZoomState.listener((zoomState) {
      _zoomStateChagnedController.add(zoomState?.dartValue);
    });
    ffiValue.addZoomStateObserverWithCallback_(callback);
  }

  void _removeZoomStateObserver() {
    final error = using((arena) {
      final errorPtr = arena<Pointer<ObjCObject>>();
      return ffiValue.removeZoomStateObserverAndReturnError_(errorPtr)
          ? null
          : NSError.castFromPointer(errorPtr.value);
    });
    if (error == null) {
      return;
    }
    throw error;
  }

  void _addTorchStateObserver() {
    final callback = ffi.ObjCBlock_ffiVoid_TorchState.listener((torchState) {
      _torchStateChagnedController.add(torchState?.value);
    });
    ffiValue.addTorchStateObserverWithCallback_(callback);
  }

  void _removeTorchStateObserver() {
    final error = using((arena) {
      final errorPtr = arena<Pointer<ObjCObject>>();
      return ffiValue.removeTorchStateObserverAndReturnError_(errorPtr)
          ? null
          : NSError.castFromPointer(errorPtr.value);
    });
    if (error == null) {
      return;
    }
    throw error;
  }
}
