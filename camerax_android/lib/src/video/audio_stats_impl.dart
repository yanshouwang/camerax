import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class AudioStatsImpl extends AudioStats {
  final AudioStatsProxyApi api;

  AudioStatsImpl.internal(this.api) : super.impl();

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

extension AudioStatsAudioStateX on AudioStats$AudioState {
  AudioStatsAudioStateApi get api => AudioStatsAudioStateApi.values[index];
}

extension AudioStatsAudioStateApiX on AudioStatsAudioStateApi {
  AudioStats$AudioState get impl => AudioStats$AudioState.values[index];
}

extension AudioStatsProxyApiX on AudioStatsProxyApi {
  AudioStats get impl => AudioStatsImpl.internal(this);
}
