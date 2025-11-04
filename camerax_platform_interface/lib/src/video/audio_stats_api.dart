enum AudioStatsAudioState {
  active,
  disabled,
  sourceSilenced,
  encoderError,
  sourceError,
  muted,
}

abstract base class AudioStatsApi {
  AudioStatsApi.impl();

  double get audioAmplitude;
  AudioStatsAudioState get audioState;
  Object? get errorCause;
  bool get hasAudio;
  bool get hasError;
}
