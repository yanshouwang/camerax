import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'audio_stats.dart';

extension RecordingStatsObj on $native.RecordingStats {
  $base.RecordingStats get args {
    return $base.RecordingStats(
      audioStats: audioStats.args,
      numBytesRecorded: numBytesRecorded,
      recordedDurationNanos: recordedDurationNanos,
    );
  }
}
