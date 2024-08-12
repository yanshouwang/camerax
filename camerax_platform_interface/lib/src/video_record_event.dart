import 'video_record_error.dart';

abstract base class VideoRecordEvent {}

final class VideoRecordStartEvent extends VideoRecordEvent {}

final class VideoRecordPauseEvent extends VideoRecordEvent {}

final class VideoRecordResumeEvent extends VideoRecordEvent {}

final class VideoRecordFinalizeEvent extends VideoRecordEvent {
  final VideoRecordError? error;
  final Uri uri;

  VideoRecordFinalizeEvent({
    required this.error,
    required this.uri,
  });
}
