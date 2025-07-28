import 'recording_stats.dart';
import 'output_results.dart';

/// VideoRecordEvent is used to report video recording events and status.
///
/// Upon starting a recording by start, recording events will start to be sent to
/// the listener passed to start.
///
/// There are Start, Finalize, Status, Pause and Resume events.
///
/// Example: Below is the typical way to determine the event type and cast to the
/// event class, if needed.
abstract base class VideoRecordEvent {
  final RecordingStats recordingStats;

  VideoRecordEvent({
    required this.recordingStats,
  });
}

/// The status report of the recording in progress.
final class VideoRecordStatusEvent extends VideoRecordEvent {
  VideoRecordStatusEvent({
    required super.recordingStats,
  });
}

/// Indicates the start of recording.
///
/// When a video recording is successfully requested by start, a Start event will
/// be the first event.
final class VideoRecordStartEvent extends VideoRecordEvent {
  VideoRecordStartEvent({
    required super.recordingStats,
  });
}

/// Indicates the pause event of recording.
///
/// A Pause event will be triggered after calling pause.
final class VideoRecordPauseEvent extends VideoRecordEvent {
  VideoRecordPauseEvent({
    required super.recordingStats,
  });
}

/// Indicates the resume event of recording.
///
/// A Resume event will be triggered after calling resume.
final class VideoRecordResumeEvent extends VideoRecordEvent {
  VideoRecordResumeEvent({
    required super.recordingStats,
  });
}

/// Indicates the finalization of recording.
///
/// The finalize event will be triggered regardless of whether the recording
/// succeeds or fails. Use getError to obtain the error type and getCause to get
/// the error cause. If there is no error, ERROR_NONE will be returned. Other
/// error types indicate the recording is failed or stopped due to a certain
/// reason. Please note that receiving a finalize event with error does not
/// necessarily mean that the video file has not been generated. In some cases,
/// the file can still be successfully generated depending on the error type. For
/// example, a file will still be generated when the recording is finalized with
/// ERROR_FILE_SIZE_LIMIT_REACHED. A file may or may not be generated when the
/// recording is finalized with ERROR_INSUFFICIENT_STORAGE.
final class VideoRecordFinalizeEvent extends VideoRecordEvent {
  /// Gets the Uri of the output.
  ///
  /// Returns the actual Uri of the output destination if the OutputOptions is
  /// implemented by MediaStoreOutputOptions or FileOutputOptions, otherwise
  /// returns EMPTY.
  final OutputResults? outputResults;

  /// Gets the error cause.
  ///
  /// Returns the error cause if any, otherwise returns null.
  ///
  /// Note that not all error types include an error cause. For some error types,
  /// the file may still be generated successfully with no error cause. For example,
  /// ERROR_FILE_SIZE_LIMIT_REACHED, ERROR_DURATION_LIMIT_REACHED and ERROR_SOURCE_INACTIVE.
  final Object? cause;

  VideoRecordFinalizeEvent({
    required super.recordingStats,
    required this.outputResults,
    required this.cause,
  });
}
