import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'audio_stats_impl.dart';

extension RecordingStatsApiX on RecordingStatsApi {
  RecordingStatsApi get impl {
    return RecordingStatsApi(
      audioStats: audioStats.impl,
      numBytesRecorded: numBytesRecorded,
      recordedDurationNanos: recordedDurationNanos,
    );
  }
}
