import 'dart:typed_data';

import 'package:hybrid_logging/hybrid_logging.dart';

import 'authorization_type.dart';
import 'camera_selector.dart';
import 'camerax.dart';
import 'flash_mode.dart';
import 'image_analyzer.dart';
import 'zoom_state.dart';

abstract interface class CameraController implements LogController {
  Stream<ZoomState?> get zoomStateChanged;
  Stream<bool?> get torchStateChanged;

  Future<bool> checkAuthorization({
    required AuthorizationType type,
  });
  Future<bool> requestAuthorization({
    required AuthorizationType type,
  });
  Future<void> bind();
  Future<void> unbind();
  Future<bool> hasCamera(CameraSelector cameraSelector);
  Future<void> setCameraSelector(CameraSelector cameraSelector);
  Future<bool> isTapToFocusEnabled();
  Future<void> setTapToFocusEnabled(bool enabled);
  Future<bool> isPinchToZoomEnabled();
  Future<void> setPinchToZoomEnabled(bool enabled);
  Future<ZoomState?> getZoomState();
  Future<void> setZoomRatio(double zoomRatio);
  Future<void> setLinearZoom(double linearZoom);
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
