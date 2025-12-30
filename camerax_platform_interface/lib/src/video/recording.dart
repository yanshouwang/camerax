import 'package:camerax_platform_interface/src/common.dart';

abstract interface class Recording implements AutoCloseable {
  Future<bool> isPersistent();
  Future<void> mute(bool muted);
  Future<void> pause();
  Future<void> resume();
  Future<void> stop();
}
