import 'package:camerax_platform_interface/src/common.dart';

abstract base class Recording extends AutoCloseable {
  Recording.impl() : super.impl();

  Future<void> mute(bool muted);
  Future<void> pause();
  Future<void> resume();
  Future<void> stop();
}
