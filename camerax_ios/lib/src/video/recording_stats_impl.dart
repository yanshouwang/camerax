import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'audio_stats_impl.dart';

extension RecordingStatsApiX on RecordingStatsApi {
  RecordingStats get impl {
    return RecordingStats(
      audioStats: audioStats.impl,
      numBytesRecorded: numBytesRecorded,
      recordedDurationNanos: recordedDurationNanos,
    );
  }
}
