import 'dart:typed_data';

import 'camera_selector.dart';
import 'camerax.dart';
import 'flash_mode.dart';
import 'image_analyzer.dart';
import 'zoom_state.dart';

abstract interface class CameraController {
  Stream<ZoomState?> get zoomStateChanged;
  Stream<bool?> get torchStateChanged;

  Future<bool> requestPermissions({
    bool enableAudio = false,
  });
  Future<void> bindToLifecycle();
  Future<void> unbind();
  Future<bool> hasCamera(CameraSelector cameraSelector);
  Future<void> setCameraSelector(CameraSelector cameraSelector);
  Future<bool> isTapToFocusEnabled();
  Future<void> setTapToFocusEnabled(bool enabled);
  Future<ZoomState?> getZoomState();
  Future<bool> isPinchToZoomEnabled();
  Future<void> setPinchToZoomEnabled(bool enabled);
  Future<void> setLinearZoom(double linearZoom);
  Future<void> setZoomRatio(double zoomRatio);
  Future<bool?> getTorchState();
  Future<void> enableTorch(bool torchEnabled);
  Future<void> setImageAnalyzer(ImageAnalyzer analyzer);
  Future<void> clearImageAnalyzer();
  Future<FlashMode> getImageCaptureFlashMode();
  Future<void> setImageCaptureFlashMode(FlashMode flashMode);
  Future<Uint8List> takePictureToMemory();
  Future<Uri> takePictureToAlbum({
    String? name,
  });

  factory CameraController() {
    return CameraXPlugin.instance.createCameraController();
  }
}
