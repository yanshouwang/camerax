import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class AudioConfig {
  static AudioConfig get audioDisabled =>
      AudioConfigChannel.instance.audioDisabled;

  factory AudioConfig.create(bool enableAudio) =>
      AudioConfigChannel.instance.create(enableAudio);

  Future<bool> getAudioEnabled();
}

abstract base class AudioConfigChannel extends PlatformInterface {
  AudioConfigChannel() : super(token: _token);

  static final _token = Object();

  static AudioConfigChannel? _instance;

  static AudioConfigChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(AudioConfigChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  AudioConfig get audioDisabled;

  AudioConfig create(bool enableAudio);
}
