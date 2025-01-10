import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension CaptureModeArgs on $base.CaptureMode {
  $native.CaptureMode get obj {
    switch (this) {
      case $base.CaptureMode.maximizeQuality:
        return $native.CaptureMode.maximizeQuality;
      case $base.CaptureMode.minimizeLatency:
        return $native.CaptureMode.minimizeLatency;
      case $base.CaptureMode.zeroShutterLag:
        return $native.CaptureMode.zeroShutterLag;
    }
  }
}

extension CaptureModeObj on $native.CaptureMode {
  $base.CaptureMode get args {
    switch (this) {
      case $native.CaptureMode.maximizeQuality:
        return $base.CaptureMode.maximizeQuality;
      case $native.CaptureMode.minimizeLatency:
        return $base.CaptureMode.minimizeLatency;
      case $native.CaptureMode.zeroShutterLag:
        return $base.CaptureMode.zeroShutterLag;
    }
  }
}
