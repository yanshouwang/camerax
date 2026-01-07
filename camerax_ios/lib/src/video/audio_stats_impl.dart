import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class AudioStatsImpl implements AudioStats {
  final AudioStatsProxyApi api;

  AudioStatsImpl.internal(this.api);

  @override
  double get audioAmplitude => api.audioAmplitude;
  @override
  AudioStats$AudioState get audioState => api.audioState.impl;
  @override
  Object? get errorCause => api.errorCause?.impl;
  @override
  bool get hasAudio => api.hasAudio;
  @override
  bool get hasError => api.hasError;
}

extension AudioStats$AudioStateX on AudioStats$AudioState {
  AudioStatsAudioStateApi get api => AudioStatsAudioStateApi.values[index];
}

extension AudioStatsAudioStateApiX on AudioStatsAudioStateApi {
  AudioStats$AudioState get impl => AudioStats$AudioState.values[index];
}

extension AudioStatsProxyApiX on AudioStatsProxyApi {
  AudioStats get impl => AudioStatsImpl.internal(this);
}
