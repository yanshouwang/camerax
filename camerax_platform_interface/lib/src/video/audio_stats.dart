enum AudioStats$AudioState {
  active,
  disabled,
  sourceSilenced,
  encoderError,
  sourceError,
  muted,
}

abstract interface class AudioStats {
  double get audioAmplitude;
  AudioStats$AudioState get audioState;
  Object? get errorCause;
  bool get hasAudio;
  bool get hasError;
}
