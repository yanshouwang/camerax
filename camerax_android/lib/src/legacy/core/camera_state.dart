import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension NativeCameraState on $native.CameraState {
  $base.CameraState get args {
    switch (this) {
      case $native.CameraState.pendingOpen:
        return $base.CameraState.pendingOpen;
      case $native.CameraState.opening:
        return $base.CameraState.opening;
      case $native.CameraState.open:
        return $base.CameraState.open;
      case $native.CameraState.closing:
        return $base.CameraState.closing;
      case $native.CameraState.closed:
        return $base.CameraState.closed;
    }
  }
}
