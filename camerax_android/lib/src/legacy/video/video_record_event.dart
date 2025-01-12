import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'recording_stats.dart';

base mixin VideoRecordEvent on $base.VideoRecordEvent {
  $native.VideoRecordEvent get obj;

  @override
  Future<$base.RecordingStats> getRecordingStats() async {
    final obj = await this.obj.getRecordingStats();
    return RecordingStats.$native(obj);
  }
}

final class VideoRecordStatusEvent extends $base.VideoRecordStatusEvent
    with VideoRecordEvent {
  @override
  final $native.VideoRecordStatusEvent obj;

  VideoRecordStatusEvent.$native(this.obj) : super.impl();
}

final class VideoRecordStartEvent extends $base.VideoRecordStartEvent
    with VideoRecordEvent {
  @override
  final $native.VideoRecordStartEvent obj;

  VideoRecordStartEvent.$native(this.obj) : super.impl();
}

final class VideoRecordPauseEvent extends $base.VideoRecordPauseEvent
    with VideoRecordEvent {
  @override
  final $native.VideoRecordPauseEvent obj;

  VideoRecordPauseEvent.$native(this.obj) : super.impl();
}

final class VideoRecordResumeEvent extends $base.VideoRecordResumeEvent
    with VideoRecordEvent {
  @override
  final $native.VideoRecordResumeEvent obj;

  VideoRecordResumeEvent.$native(this.obj) : super.impl();
}

final class VideoRecordFinalizeEvent extends $base.VideoRecordFinalizeEvent
    with VideoRecordEvent {
  @override
  final $native.VideoRecordFinalizeEvent obj;

  VideoRecordFinalizeEvent.$native(this.obj) : super.impl();

  @override
  Future<Object?> getError() async {
    final value = await obj.getCause();
    return value;
  }

  @override
  Future<Uri?> getOutputUri() async {
    final resultsObj = await obj.getOutputResults();
    final uriObj = await resultsObj.getOutputUri();
    final value = await uriObj.getPath();
    return value == null ? null : Uri.parse(value);
  }
}
