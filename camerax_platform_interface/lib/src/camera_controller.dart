import 'camera_selector.dart';
import 'camerax.dart';
import 'zoom_state.dart';

abstract interface class CameraController {
  Stream<ZoomState?> get zoomStateChanged;

  Future<bool> requestPermissions({
    bool enableAudio = false,
  });
  Future<void> bind();
  Future<void> unbind();
  Future<bool> hasCamera(CameraSelector cameraSelector);
  Future<void> setCameraSelector(CameraSelector cameraSelector);
  Future<bool> isPinchToZoomEnabled();
  Future<void> setPinchToZoomEnabled(bool enabled);
  Future<bool> isTapToFocusEnabled();
  Future<void> setTapToFocusEnabled(bool enabled);
  Future<ZoomState?> getZoomState();
  Future<void> setLinearZoom(double linearZoom);
  Future<void> setZoomRatio(double zoomRatio);

  factory CameraController() {
    return CameraXPlugin.instance.createCameraController();
  }
}
