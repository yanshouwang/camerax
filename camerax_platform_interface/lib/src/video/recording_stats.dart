import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'audio_stats.dart';

abstract base class RecordingStats extends PlatformInterface {
  static final _token = Object();

  RecordingStats.impl() : super(token: _token);

  Future<AudioStats> getAudioStats();
  Future<int> getNumBytesRecorded();
  Future<int> getRecordedDurationNanos();
}
