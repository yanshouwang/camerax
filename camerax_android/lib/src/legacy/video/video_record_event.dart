import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'recording_stats.dart';
import 'video_output_results.dart';

extension VideoRecordEventObj on $native.VideoRecordEvent {
  $base.VideoRecordEvent get args {
    final event = this;
    if (event is $native.VideoRecordStatusEvent) {
      return $base.VideoRecordStatusEvent(
        recordingStats: event.recordingStats.args,
      );
    } else if (event is $native.VideoRecordStartEvent) {
      return $base.VideoRecordStartEvent(
        recordingStats: event.recordingStats.args,
      );
    } else if (event is $native.VideoRecordPauseEvent) {
      return $base.VideoRecordPauseEvent(
        recordingStats: event.recordingStats.args,
      );
    } else if (event is $native.VideoRecordResumeEvent) {
      return $base.VideoRecordResumeEvent(
        recordingStats: event.recordingStats.args,
      );
    } else if (event is $native.VideoRecordFinalizeEvent) {
      return $base.VideoRecordFinalizeEvent(
        recordingStats: event.recordingStats.args,
        outputResults: event.outputResults.args,
        cause: event.cause?.args,
      );
    } else {
      throw TypeError();
    }
  }
}
