import 'audio_state.dart';

final class AudioStats {
  final double audioAmplitude;
  final AudioState audioState;
  final Object? error;
  final bool hasAudio;
  final bool hasError;

  AudioStats({
    required this.audioAmplitude,
    required this.audioState,
    required this.error,
    required this.hasAudio,
    required this.hasError,
  });

  @override
  int get hashCode => Object.hash(
        audioAmplitude,
        audioState,
        error,
        hasAudio,
        hasError,
      );

  @override
  bool operator ==(Object other) {
    return other is AudioStats &&
        other.audioAmplitude == audioAmplitude &&
        other.audioState == audioState &&
        other.error == error &&
        other.hasAudio == hasAudio &&
        other.hasError == hasError;
  }
}
