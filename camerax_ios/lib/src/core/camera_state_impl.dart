import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension CameraStateApiX on CameraStateApi {
  CameraState get impl {
    switch (this) {
      case CameraStateApi.pendingOpen:
        return CameraState.pendingOpen;
      case CameraStateApi.opening:
        return CameraState.opening;
      case CameraStateApi.open:
        return CameraState.open;
      case CameraStateApi.closing:
        return CameraState.closing;
      case CameraStateApi.closed:
        return CameraState.closed;
    }
  }
}
