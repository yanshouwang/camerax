import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension NativeCameraState on $native.CameraState {
  $interface.CameraState get args {
    switch (this) {
      case $native.CameraState.pendingOpen:
        return $interface.CameraState.pendingOpen;
      case $native.CameraState.opening:
        return $interface.CameraState.opening;
      case $native.CameraState.open:
        return $interface.CameraState.open;
      case $native.CameraState.closing:
        return $interface.CameraState.closing;
      case $native.CameraState.closed:
        return $interface.CameraState.closed;
    }
  }
}
