import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'recording_stats_impl.dart';
import 'video_output_results_impl.dart';

extension VideoRecordEventApiX on VideoRecordEventApi {
  VideoRecordEvent get impl {
    final api = this;
    if (api is VideoRecordStatusEventApi) {
      return VideoRecordStatusEvent(
        recordingStats: api.recordingStats.impl,
      );
    } else if (api is VideoRecordStartEventApi) {
      return VideoRecordStartEvent(
        recordingStats: api.recordingStats.impl,
      );
    } else if (api is VideoRecordPauseEventApi) {
      return VideoRecordPauseEvent(
        recordingStats: api.recordingStats.impl,
      );
    } else if (api is VideoRecordResumeEventApi) {
      return VideoRecordResumeEvent(
        recordingStats: api.recordingStats.impl,
      );
    } else if (api is VideoRecordFinalizeEventApi) {
      return VideoRecordFinalizeEvent(
        recordingStats: api.recordingStats.impl,
        outputResults: api.outputResults.impl,
        cause: api.cause?.impl,
      );
    } else {
      throw TypeError();
    }
  }
}
