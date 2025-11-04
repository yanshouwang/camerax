import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'recording_stats_impl.dart';
import 'output_results_impl.dart';

extension VideoRecordEventApiX on VideoRecordEventApi {
  VideoRecordEventApi get impl {
    final api = this;
    if (api is VideoRecordStatusEventApi) {
      return VideoRecordStatusEventApi(recordingStats: api.recordingStats.impl);
    } else if (api is VideoRecordStartEventApi) {
      return VideoRecordStartEventApi(recordingStats: api.recordingStats.impl);
    } else if (api is VideoRecordPauseEventApi) {
      return VideoRecordPauseEventApi(recordingStats: api.recordingStats.impl);
    } else if (api is VideoRecordResumeEventApi) {
      return VideoRecordResumeEventApi(recordingStats: api.recordingStats.impl);
    } else if (api is VideoRecordFinalizeEventApi) {
      return VideoRecordFinalizeEventApi(
        recordingStats: api.recordingStats.impl,
        outputResults: api.outputResults.impl,
        cause: api.cause?.impl,
      );
    } else {
      throw TypeError();
    }
  }
}
