import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class AudioStatsImpl extends AudioStats {
  final AudioStatsProxyApi api;

  AudioStatsImpl.internal(this.api) : super.impl();

  @override
  double get audioAmplitude => api.audioAmplitude;
  @override
  AudioStatsAudioState get audioState => api.audioState.impl;
  @override
  Object? get errorCause => api.errorCause?.impl;
  @override
  bool get hasAudio => api.hasAudio;
  @override
  bool get hasError => api.hasError;
}

extension AudioStatsAudioStateX on AudioStatsAudioState {
  AudioStatsAudioStateApi get api => AudioStatsAudioStateApi.values[index];
}

extension AudioStatsAudioStateApiX on AudioStatsAudioStateApi {
  AudioStatsAudioState get impl => AudioStatsAudioState.values[index];
}

extension AudioStatsProxyApiX on AudioStatsProxyApi {
  AudioStats get impl => AudioStatsImpl.internal(this);
}
