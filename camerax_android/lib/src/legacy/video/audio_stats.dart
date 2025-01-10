import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'audio_state.dart';

final class AudioStats extends $base.AudioStats {
  final $native.AudioStats obj;

  AudioStats.$native(this.obj) : super.impl();

  @override
  Future<double> getAudioAmplitude() async {
    final value = await obj.getAudioAmplitude();
    return value;
  }

  @override
  Future<$base.AudioState> getAudioState() async {
    final obj = await this.obj.getAudioState();
    return obj.args;
  }

  @override
  Future<Object?> getError() async {
    final value = await obj.getErrorCause();
    return value;
  }

  @override
  Future<bool> hasAudio() async {
    final value = await obj.hasAudio();
    return value;
  }

  @override
  Future<bool> hasError() async {
    final value = await obj.hasError();
    return value;
  }
}
