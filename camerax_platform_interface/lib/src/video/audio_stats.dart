import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'audio_state.dart';

abstract base class AudioStats extends PlatformInterface {
  static final _token = Object();

  AudioStats.impl() : super(token: _token);

  Future<double> getAudioAmplitude();
  Future<AudioState> getAudioState();
  Future<Object?> getError();
  Future<bool> hasAudio();
  Future<bool> hasError();
}
