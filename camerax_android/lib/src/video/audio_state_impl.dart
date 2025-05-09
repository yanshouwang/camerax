import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AudioStateX on AudioState {
  AudioStateApi get api {
    switch (this) {
      case AudioState.active:
        return AudioStateApi.active;
      case AudioState.disabled:
        return AudioStateApi.disabled;
      case AudioState.sourceSilenced:
        return AudioStateApi.sourceSilenced;
      case AudioState.encoderError:
        return AudioStateApi.encoderError;
      case AudioState.sourceError:
        return AudioStateApi.sourceError;
      case AudioState.muted:
        return AudioStateApi.muted;
    }
  }
}

extension AudioStateApiX on AudioStateApi {
  AudioState get impl {
    switch (this) {
      case AudioStateApi.active:
        return AudioState.active;
      case AudioStateApi.disabled:
        return AudioState.disabled;
      case AudioStateApi.sourceSilenced:
        return AudioState.sourceSilenced;
      case AudioStateApi.encoderError:
        return AudioState.encoderError;
      case AudioStateApi.sourceError:
        return AudioState.sourceError;
      case AudioStateApi.muted:
        return AudioState.muted;
    }
  }
}
