import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Provides controls for the currently active recording.
///
/// An active recording is created by starting a pending recording with start. If
/// there are no errors starting the recording, upon creation, an active recording
/// will provide controls to pause, resume or stop a recording. If errors occur
/// while starting the recording, the active recording will be instantiated in a
/// finalized state, and all controls will be no-ops. The state of the recording
/// can be observed by the video record event listener provided to start when
/// starting the recording.
///
/// Either stop or close can be called when it is desired to stop the recording.
/// If stop or close are not called on this object before it is no longer referenced,
/// it will be automatically stopped at a future point in time when the object is
/// garbage collected, and no new recordings can be started from the same Recorder
/// that generated the object until that occurs.
abstract base class Recording extends PlatformInterface {
  static final _token = Object();

  Recording.impl() : super(token: _token);

  /// Mutes or un-mutes the current recording.
  ///
  /// The output file will contain an audio track even the whole recording is
  /// muted. Create a recording without calling withAudioEnabled to record a file
  /// with no audio track. To set the initial mute state of the recording, use
  /// withAudioEnabled.
  ///
  /// Muting or unmuting a recording that isn't created withAudioEnabled with
  /// audio enabled is no-op.
  Future<void> mute(bool muted);

  /// Pauses the current recording if active.
  ///
  /// Successful pausing of a recording will generate a VideoRecordEvent.Pause
  /// event which will be sent to the listener passed to start.
  ///
  /// If the recording has already been paused or has been finalized internally,
  /// this is a no-op.
  Future<void> pause();

  /// Resumes the current recording if paused.
  ///
  /// Successful resuming of a recording will generate a VideoRecordEvent.Resume
  /// event which will be sent to the listener passed to start.
  ///
  /// If the recording is active or has been finalized internally, this is a no-op.
  Future<void> resume();

  /// Stops the recording, as if calling close.
  ///
  /// This method is equivalent to calling close.
  Future<void> stop();

  /// Close this recording.
  ///
  /// Once stop or close() called, all methods for controlling the state of this
  /// recording besides stop or close() will throw an IllegalStateException.
  ///
  /// Once an active recording has been closed, the next recording can be started
  /// with start.
  ///
  /// This method is idempotent; if the recording has already been closed or has
  /// been finalized internally, calling stop or close() is a no-op.
  ///
  /// This method is invoked automatically on active recording instances managed
  /// by the try-with-resources statement.
  Future<void> close();
}
