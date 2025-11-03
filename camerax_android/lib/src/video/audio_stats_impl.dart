import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AudioStatsAudioStateX on AudioStatsAudioState {
  AudioStatsAudioStateApi get api => AudioStatsAudioStateApi.values[index];
}

extension AudioStatsAudioStateApiX on AudioStatsAudioStateApi {
  AudioStatsAudioState get impl => AudioStatsAudioState.values[index];
}

extension AudioStatsApiX on AudioStatsApi {
  AudioStats get impl {
    return AudioStats(
      audioAmplitude: audioAmplitude,
      audioState: audioState.impl,
      errorCause: errorCause?.impl,
      hasAudio: hasAudio,
      hasError: hasError,
    );
  }
}
