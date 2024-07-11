import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:ffi/ffi.dart';
import 'package:objective_c/objective_c.dart';

import 'ffi.dart';
import 'ffi.g.dart';

final class CameraControllerImpl implements CameraController {
  final AVCaptureSession session;
  late final StreamController<ZoomState?> _zoomStateChagnedController;
  late final StreamController<bool?> _torchStateChagnedController;
  late AVCaptureInput _activeVideoInput;

  CameraControllerImpl() : session = AVCaptureSession.alloc().init() {
    _zoomStateChagnedController = StreamController.broadcast(
        // onListen: _observeZoomState,
        // onCancel: _removeZoomStateObserver,
        );
    _torchStateChagnedController = StreamController.broadcast(
        // onListen: _observeTorchState,
        // onCancel: _removeTorchStateObserver,
        );
    session.beginConfiguration();
    try {
      _addVideoInput(CameraSelector.back);
    } finally {
      session.commitConfiguration();
    }
  }

  @override
  Stream<ZoomState?> get zoomStateChanged => _zoomStateChagnedController.stream;
  @override
  Stream<bool?> get torchStateChanged => _torchStateChagnedController.stream;

  @override
  Future<bool> requestPermissions({bool enableAudio = false}) async {
    final completer = Completer<bool>();
    final mediaType =
        DartAVMediaType.castFromPointer(avFoundationLib.AVMediaTypeVideo);
    final handler = ObjCBlock_ffiVoid_bool.listener((granted) {
      completer.complete(granted);
    });
    AVCaptureDevice.requestAccessForMediaType_completionHandler_(
        mediaType, handler);
    final granted = await completer.future;
    return granted;
  }

  @override
  Future<void> bindToLifecycle() async {
    session.startRunning();
  }

  @override
  Future<void> unbind() async {
    session.stopRunning();
  }

  @override
  Future<bool> hasCamera(CameraSelector cameraSelector) async {
    final device = _getVideoDevice(cameraSelector);
    return device != null;
  }

  @override
  Future<void> setCameraSelector(CameraSelector cameraSelector) async {
    session.beginConfiguration();
    try {
      session.removeInput_(_activeVideoInput);
      _addVideoInput(cameraSelector);
    } finally {
      session.commitConfiguration();
    }
  }

  AVCaptureDevice? _getVideoDevice(CameraSelector cameraSelector) {
    final deviceType = cameraSelector.lensFacing == LensFacing.external
        ? DartAVCaptureDeviceType.castFromPointer(
            avFoundationLib.AVCaptureDeviceTypeExternal)
        : DartAVCaptureDeviceType.castFromPointer(
            avFoundationLib.AVCaptureDeviceTypeBuiltInWideAngleCamera);
    final mediaType =
        DartAVMediaType.castFromPointer(avFoundationLib.AVMediaTypeVideo);
    final position = cameraSelector.lensFacing == LensFacing.back
        ? AVCaptureDevicePosition.AVCaptureDevicePositionBack
        : cameraSelector.lensFacing == LensFacing.front
            ? AVCaptureDevicePosition.AVCaptureDevicePositionFront
            : AVCaptureDevicePosition.AVCaptureDevicePositionUnspecified;
    final device =
        AVCaptureDevice.defaultDeviceWithDeviceType_mediaType_position_(
      deviceType,
      mediaType,
      position,
    );
    return device;
  }

  void _addVideoInput(CameraSelector cameraSelector) {
    final device = _getVideoDevice(cameraSelector);
    if (device == null) {
      throw ArgumentError.notNull();
    }
    final input = using((arena) {
      final error = arena<Pointer<ObjCObject>>();
      final input =
          AVCaptureDeviceInput.deviceInputWithDevice_error_(device, error);
      return input;
    });
    if (input == null) {
      throw ArgumentError.notNull();
    }
    session.addInput_(input);
    _activeVideoInput = input;
  }

  @override
  Future<bool> isTapToFocusEnabled() {
    // TODO: implement isTapToFocusEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setTapToFocusEnabled(bool enabled) {
    // TODO: implement setTapToFocusEnabled
    throw UnimplementedError();
  }

  @override
  Future<ZoomState?> getZoomState() {
    // TODO: implement getZoomState
    throw UnimplementedError();
  }

  @override
  Future<bool> isPinchToZoomEnabled() {
    // TODO: implement isPinchToZoomEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setPinchToZoomEnabled(bool enabled) {
    // TODO: implement setPinchToZoomEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setLinearZoom(double linearZoom) {
    // TODO: implement setLinearZoom
    throw UnimplementedError();
  }

  @override
  Future<void> setZoomRatio(double zoomRatio) {
    // TODO: implement setZoomRatio
    throw UnimplementedError();
  }

  @override
  Future<bool?> getTorchState() {
    // TODO: implement getTorchState
    throw UnimplementedError();
  }

  @override
  Future<void> enableTorch(bool torchEnabled) {
    // TODO: implement enableTorch
    throw UnimplementedError();
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
  Future<FlashMode> getImageCaptureFlashMode() {
    // TODO: implement getImageCaptureFlashMode
    throw UnimplementedError();
  }

  @override
  Future<void> setImageCaptureFlashMode(FlashMode flashMode) {
    // TODO: implement setImageCaptureFlashMode
    throw UnimplementedError();
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
}
