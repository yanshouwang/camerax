import 'audio_stats_api.dart';

abstract base class RecordingStatsApi {
  RecordingStatsApi.impl();

  AudioStats get audioStats;
  int get numBytesRecorded;
  int get recordedDurationNanos;
}
