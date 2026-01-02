import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class AudioConfigImpl implements AudioConfig {
  final AudioConfigProxyApi api;

  AudioConfigImpl.internal(this.api);

  @override
  Future<bool> getAudioEnabled() => api.getAudioEnabled();
}

final class AudioConfigChannelImpl extends AudioConfigChannel {
  @override
  AudioConfig get audioDisabled =>
      AudioConfigImpl.internal(AudioConfigProxyApi.audioDisabled);

  @override
  AudioConfig create(bool enableAudio) {
    final api = AudioConfigProxyApi.create(enableAudio: enableAudio);
    return AudioConfigImpl.internal(api);
  }
}

extension AudioConfigX on AudioConfig {
  AudioConfigProxyApi get api {
    final impl = this;
    if (impl is! AudioConfigImpl) throw TypeError();
    return impl.api;
  }
}
