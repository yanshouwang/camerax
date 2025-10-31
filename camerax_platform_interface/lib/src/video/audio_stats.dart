enum AudioStatsAudioState {
  active,
  disabled,
  sourceSilenced,
  encoderError,
  sourceError,
  muted,
}

final class AudioStats {
  final double audioAmplitude;
  final AudioStatsAudioState audioState;
  final Object? errorCause;
  final bool hasAudio;
  final bool hasError;

  AudioStats({
    required this.audioAmplitude,
    required this.audioState,
    required this.errorCause,
    required this.hasAudio,
    required this.hasError,
  });

  @override
  int get hashCode =>
      Object.hash(audioAmplitude, audioState, errorCause, hasAudio, hasError);

  @override
  bool operator ==(Object other) {
    return other is AudioStats &&
        other.audioAmplitude == audioAmplitude &&
        other.audioState == audioState &&
        other.errorCause == errorCause &&
        other.hasAudio == hasAudio &&
        other.hasError == hasError;
  }
}
