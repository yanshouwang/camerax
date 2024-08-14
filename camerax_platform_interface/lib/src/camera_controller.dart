import 'package:hybrid_logging/hybrid_logging.dart';

import 'authorization_type.dart';
import 'camera_selector.dart';
import 'camerax_plugin.dart';
import 'flash_mode.dart';
import 'image_analyzer.dart';
import 'image_proxy.dart';
import 'recording.dart';
import 'video_record_event.dart';
import 'zoom_state.dart';

typedef VideoRecordEventCallback = void Function(VideoRecordEvent event);

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
  Future<CameraSelector> getCameraSelector();
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
  Future<void> setImageAnalysisAnalyzer(ImageAnalyzer analyzer);
  Future<void> clearImageAnalysisAnalyzer();
  Future<FlashMode> getImageCaptureFlashMode();
  Future<void> setImageCaptureFlashMode(FlashMode flashMode);
  Future<ImageProxy> takePictureToMemory();
  Future<Uri> takePictureToAlbum({
    String? name,
  });
  Future<Recording> startRecording({
    String? name,
    required bool enableAudio,
    required VideoRecordEventCallback listener,
  });

  factory CameraController() {
    return CameraXPlugin.instance.createCameraController();
  }
}
