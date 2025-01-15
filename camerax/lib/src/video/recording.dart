import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

final class Recording {
  final $interface.Recording _obj;

  Recording._native(this._obj);

  @internal
  $interface.Recording get obj => _obj;

  /// Mutes or un-mutes the current recording.
  ///
  /// The output file will contain an audio track even the whole recording is
  /// muted. Create a recording without calling withAudioEnabled to record a file
  /// with no audio track. To set the initial mute state of the recording, use
  /// withAudioEnabled.
  ///
  /// Muting or unmuting a recording that isn't created withAudioEnabled with
  /// audio enabled is no-op.
  Future<void> mute(bool muted) => _obj.mute(muted);

  /// Pauses the current recording if active.
  ///
  /// Successful pausing of a recording will generate a VideoRecordEvent.Pause
  /// event which will be sent to the listener passed to start.
  ///
  /// If the recording has already been paused or has been finalized internally,
  /// this is a no-op.
  Future<void> pause() => _obj.pause();

  /// Resumes the current recording if paused.
  ///
  /// Successful resuming of a recording will generate a VideoRecordEvent.Resume
  /// event which will be sent to the listener passed to start.
  ///
  /// If the recording is active or has been finalized internally, this is a no-op.
  Future<void> resume() => _obj.resume();

  /// Stops the recording, as if calling close.
  ///
  /// This method is equivalent to calling close.
  Future<void> stop() => _obj.stop();

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
  Future<void> close() => _obj.close();
}

extension RecordingObj on $interface.Recording {
  @internal
  Recording get args {
    return Recording._native(this);
  }
}
