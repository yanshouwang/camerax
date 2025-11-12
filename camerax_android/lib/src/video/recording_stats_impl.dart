import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'audio_stats_impl.dart';

final class RecordingStatsImpl extends RecordingStats {
  final RecordingStatsProxyApi api;

  RecordingStatsImpl.internal(this.api) : super.impl();

  @override
  AudioStats get audioStats => api.audioStats.impl;
  @override
  int get numBytesRecorded => api.numBytesRecorded;
  @override
  Duration get recordedDuration =>
      Duration(microseconds: api.recordedDurationNanos ~/ 1000);
}

extension RecordingStatsProxyApiX on RecordingStatsProxyApi {
  RecordingStats get impl => RecordingStatsImpl.internal(this);
}
