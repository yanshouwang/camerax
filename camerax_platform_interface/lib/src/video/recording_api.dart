import 'package:camerax_platform_interface/src/common.dart';

abstract base class RecordingApi extends AutoCloseable {
  RecordingApi.impl() : super.impl();

  Future<bool> isPersistent();
  Future<void> mute(bool muted);
  Future<void> pause();
  Future<void> resume();
  Future<void> stop();
}
