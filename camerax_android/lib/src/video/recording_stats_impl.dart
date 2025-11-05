import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'audio_stats_impl.dart';

final class RecordingStatsImpl extends RecordingStatsApi {
  final RecordingStatsProxyApi api;

  RecordingStatsImpl.internal(this.api) : super.impl();

  @override
  AudioStatsApi get audioStats => api.audioStats.impl;
  @override
  int get numBytesRecorded => api.numBytesRecorded;
  @override
  int get recordedDurationNanos => api.recordedDurationNanos;
}

extension RecordingStatsProxyApiX on RecordingStatsProxyApi {
  RecordingStatsApi get impl => RecordingStatsImpl.internal(this);
}
