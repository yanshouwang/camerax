import 'camera_selector.dart';
import 'camera_state.dart';
import 'exposure_state.dart';

final class CameraInfo {
  final CameraSelector cameraSelector;
  final CameraState cameraState;
  final ExposureState exposureState;

  CameraInfo({
    required this.cameraSelector,
    required this.cameraState,
    required this.exposureState,
  });
}
