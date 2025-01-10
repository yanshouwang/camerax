import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension AudioStateArgs on $base.AudioState {
  $native.AudioState get obj {
    switch (this) {
      case $base.AudioState.active:
        return $native.AudioState.active;
      case $base.AudioState.disabled:
        return $native.AudioState.disabled;
      case $base.AudioState.sourceSilenced:
        return $native.AudioState.sourceSilenced;
      case $base.AudioState.encoderError:
        return $native.AudioState.encoderError;
      case $base.AudioState.sourceError:
        return $native.AudioState.sourceError;
      case $base.AudioState.muted:
        return $native.AudioState.muted;
    }
  }
}

extension AudioStateObj on $native.AudioState {
  $base.AudioState get args {
    switch (this) {
      case $native.AudioState.active:
        return $base.AudioState.active;
      case $native.AudioState.disabled:
        return $base.AudioState.disabled;
      case $native.AudioState.sourceSilenced:
        return $base.AudioState.sourceSilenced;
      case $native.AudioState.encoderError:
        return $base.AudioState.encoderError;
      case $native.AudioState.sourceError:
        return $base.AudioState.sourceError;
      case $native.AudioState.muted:
        return $base.AudioState.muted;
    }
  }
}
