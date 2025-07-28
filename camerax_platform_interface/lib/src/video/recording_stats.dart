import 'audio_stats.dart';

final class RecordingStats {
  final AudioStats audioStats;
  final int numBytesRecorded;
  final int recordedDurationNanos;

  RecordingStats({
    required this.audioStats,
    required this.numBytesRecorded,
    required this.recordedDurationNanos,
  });

  @override
  int get hashCode => Object.hash(
        audioStats,
        numBytesRecorded,
        recordedDurationNanos,
      );

  @override
  bool operator ==(Object other) {
    return other is RecordingStats &&
        other.audioStats == audioStats &&
        other.numBytesRecorded == numBytesRecorded &&
        other.recordedDurationNanos == recordedDurationNanos;
  }
}
