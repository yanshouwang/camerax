import 'camera_selector.dart';
import 'camerax.dart';

abstract interface class CameraController {
  Future<bool> requestPermissions({
    bool enableAudio = false,
  });
  Future<void> bind();
  Future<void> unbind();
  Future<void> setCameraSelector(CameraSelector cameraSelector);
  Future<bool> isPinchToZoomEnabled();
  Future<void> setPinchToZoomEnabled(bool enabled);
  Future<bool> isTapToFocusEnabled();
  Future<void> setTapToFocusEnabled(bool enabled);
  Future<void> setLinearZoom(double linearZoom);
  Future<void> setZoomRatio(double zoomRatio);

  factory CameraController() {
    return CameraXPlugin.instance.createCameraController();
  }
}
