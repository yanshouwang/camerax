import 'audio_stats.dart';

abstract base class RecordingStats {
  RecordingStats.impl();

  AudioStats get audioStats;
  int get numBytesRecorded;
  Duration get recordedDuration;
}
