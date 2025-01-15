import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension AudioStateArgs on $interface.AudioState {
  $native.AudioState get obj {
    switch (this) {
      case $interface.AudioState.active:
        return $native.AudioState.active;
      case $interface.AudioState.disabled:
        return $native.AudioState.disabled;
      case $interface.AudioState.sourceSilenced:
        return $native.AudioState.sourceSilenced;
      case $interface.AudioState.encoderError:
        return $native.AudioState.encoderError;
      case $interface.AudioState.sourceError:
        return $native.AudioState.sourceError;
      case $interface.AudioState.muted:
        return $native.AudioState.muted;
    }
  }
}

extension AudioStateObj on $native.AudioState {
  $interface.AudioState get args {
    switch (this) {
      case $native.AudioState.active:
        return $interface.AudioState.active;
      case $native.AudioState.disabled:
        return $interface.AudioState.disabled;
      case $native.AudioState.sourceSilenced:
        return $interface.AudioState.sourceSilenced;
      case $native.AudioState.encoderError:
        return $interface.AudioState.encoderError;
      case $native.AudioState.sourceError:
        return $interface.AudioState.sourceError;
      case $native.AudioState.muted:
        return $interface.AudioState.muted;
    }
  }
}
