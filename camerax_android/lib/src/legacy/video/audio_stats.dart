import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'audio_state.dart';

extension AudioStatsObj on $native.AudioStats {
  $base.AudioStats get args {
    return $base.AudioStats(
      audioAmplitude: audioAmplitude,
      audioState: audioState.args,
      errorCause: errorCause?.args,
      hasAudio: hasAudio,
      hasError: hasError,
    );
  }
}
