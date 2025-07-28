import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'audio_state_impl.dart';

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
