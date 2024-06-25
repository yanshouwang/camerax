import 'camera_selector.dart';
import 'camerax.dart';
import 'zoom_state.dart';

abstract interface class CameraController {
  Stream<ZoomState?> get zoomStateChanged;

  Future<bool> requestPermissions({
    bool enableAudio = false,
  });
  void bind();
  void unbind();
  bool hasCamera(CameraSelector cameraSelector);
  void setCameraSelector(CameraSelector cameraSelector);
  bool get isTapToFocusEnabled;
  set isTapToFocusEnabled(bool value);
  ZoomState? get zoomState;
  bool get isPinchToZoomEnabled;
  set isPinchToZoomEnabled(bool value);
  Future<void> setLinearZoom(double linearZoom);
  Future<void> setZoomRatio(double zoomRatio);

  factory CameraController() {
    return CameraXPlugin.instance.createCameraController();
  }
}
