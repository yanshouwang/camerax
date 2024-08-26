abstract base class VideoRecordEvent {}

final class VideoRecordStartEvent extends VideoRecordEvent {}

final class VideoRecordPauseEvent extends VideoRecordEvent {}

final class VideoRecordResumeEvent extends VideoRecordEvent {}

final class VideoRecordFinalizeEvent extends VideoRecordEvent {
  final Uri savedUri;
  final Object? error;

  VideoRecordFinalizeEvent({
    required this.savedUri,
    required this.error,
  });
}
