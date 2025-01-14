final class AudioConfig {
  static const audioDisabled = AudioConfig.create(false);

  final bool audioEnabled;

  const AudioConfig.create(bool enableAudio) : audioEnabled = enableAudio;
}
