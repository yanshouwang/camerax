import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class RecordingStatsImpl implements RecordingStats {
  final RecordingStatsProxyApi api;

  RecordingStatsImpl.internal(this.api);

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
