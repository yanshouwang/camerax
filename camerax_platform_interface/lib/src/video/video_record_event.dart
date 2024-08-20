import 'video_record_error.dart';

abstract base class VideoRecordEvent {}

final class VideoRecordStartEvent extends VideoRecordEvent {}

final class VideoRecordPauseEvent extends VideoRecordEvent {}

final class VideoRecordResumeEvent extends VideoRecordEvent {}

final class VideoRecordFinalizeEvent extends VideoRecordEvent {
  final Uri uri;
  final VideoRecordError? error;

  VideoRecordFinalizeEvent({
    required this.uri,
    required this.error,
  });
}
