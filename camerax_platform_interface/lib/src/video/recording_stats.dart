import 'package:camerax_platform_interface/src/video.dart';

abstract interface class RecordingStats {
  AudioStats get audioStats;
  int get numBytesRecorded;
  Duration get recordedDuration;
}
