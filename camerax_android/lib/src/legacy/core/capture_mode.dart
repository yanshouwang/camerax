import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension CaptureModeArgs on $interface.CaptureMode {
  $native.CaptureMode get obj {
    switch (this) {
      case $interface.CaptureMode.maximizeQuality:
        return $native.CaptureMode.maximizeQuality;
      case $interface.CaptureMode.minimizeLatency:
        return $native.CaptureMode.minimizeLatency;
      case $interface.CaptureMode.zeroShutterLag:
        return $native.CaptureMode.zeroShutterLag;
    }
  }
}

extension CaptureModeObj on $native.CaptureMode {
  $interface.CaptureMode get args {
    switch (this) {
      case $native.CaptureMode.maximizeQuality:
        return $interface.CaptureMode.maximizeQuality;
      case $native.CaptureMode.minimizeLatency:
        return $interface.CaptureMode.minimizeLatency;
      case $native.CaptureMode.zeroShutterLag:
        return $interface.CaptureMode.zeroShutterLag;
    }
  }
}
