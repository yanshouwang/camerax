import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AudioStateX on AudioStatsAudioState {
  AudioStateApi get api {
    switch (this) {
      case AudioStatsAudioState.active:
        return AudioStateApi.active;
      case AudioStatsAudioState.disabled:
        return AudioStateApi.disabled;
      case AudioStatsAudioState.sourceSilenced:
        return AudioStateApi.sourceSilenced;
      case AudioStatsAudioState.encoderError:
        return AudioStateApi.encoderError;
      case AudioStatsAudioState.sourceError:
        return AudioStateApi.sourceError;
      case AudioStatsAudioState.muted:
        return AudioStateApi.muted;
    }
  }
}

extension AudioStateApiX on AudioStateApi {
  AudioStatsAudioState get impl {
    switch (this) {
      case AudioStateApi.active:
        return AudioStatsAudioState.active;
      case AudioStateApi.disabled:
        return AudioStatsAudioState.disabled;
      case AudioStateApi.sourceSilenced:
        return AudioStatsAudioState.sourceSilenced;
      case AudioStateApi.encoderError:
        return AudioStatsAudioState.encoderError;
      case AudioStateApi.sourceError:
        return AudioStatsAudioState.sourceError;
      case AudioStateApi.muted:
        return AudioStatsAudioState.muted;
    }
  }
}
