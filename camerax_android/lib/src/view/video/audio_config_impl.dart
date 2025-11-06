import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class AudioConfigImpl extends AudioConfig {
  final AudioConfigProxyApi api;

  AudioConfigImpl.internal(this.api) : super.impl();

  factory AudioConfigImpl.create(bool enableAudio) {
    final api = AudioConfigProxyApi.create(enableAudio: enableAudio);
    return AudioConfigImpl.internal(api);
  }

  @override
  Future<bool> getAudioEnabled() => api.getAudioEnabled();
}

extension AudioConfigX on AudioConfig {
  AudioConfigProxyApi get api {
    final impl = this;
    if (impl is! AudioConfigImpl) throw TypeError();
    return impl.api;
  }
}
