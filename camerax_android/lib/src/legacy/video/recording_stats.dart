import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'audio_stats.dart';

final class RecordingStats extends $base.RecordingStats {
  final $native.RecordingStats obj;

  RecordingStats.$native(this.obj) : super.impl();

  @override
  Future<$base.AudioStats> getAudioStats() async {
    final obj = await this.obj.getAudioStats();
    return AudioStats.$native(obj);
  }

  @override
  Future<int> getNumBytesRecorded() async {
    final value = await obj.getNumBytesRecorded();
    return value;
  }

  @override
  Future<int> getRecordedDurationNanos() async {
    final value = await obj.getRecordedDurationNanos();
    return value;
  }
}
