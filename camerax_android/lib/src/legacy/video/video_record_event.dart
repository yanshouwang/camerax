import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'recording_stats.dart';
import 'video_output_results.dart';

extension VideoRecordEventObj on $native.VideoRecordEvent {
  $interface.VideoRecordEvent get args {
    final event = this;
    if (event is $native.VideoRecordStatusEvent) {
      return $interface.VideoRecordStatusEvent(
        recordingStats: event.recordingStats.args,
      );
    } else if (event is $native.VideoRecordStartEvent) {
      return $interface.VideoRecordStartEvent(
        recordingStats: event.recordingStats.args,
      );
    } else if (event is $native.VideoRecordPauseEvent) {
      return $interface.VideoRecordPauseEvent(
        recordingStats: event.recordingStats.args,
      );
    } else if (event is $native.VideoRecordResumeEvent) {
      return $interface.VideoRecordResumeEvent(
        recordingStats: event.recordingStats.args,
      );
    } else if (event is $native.VideoRecordFinalizeEvent) {
      return $interface.VideoRecordFinalizeEvent(
        recordingStats: event.recordingStats.args,
        outputResults: event.outputResults.args,
        cause: event.cause?.args,
      );
    } else {
      throw TypeError();
    }
  }
}
