import 'package:plugin_platform_interface/plugin_platform_interface.dart';

final _token = Object();

abstract interface class Recording {
  Future<void> mute(bool muted);
  Future<void> pause();
  Future<void> resume();
  Future<void> stop();
  Future<void> close();
}

abstract base class RecordingChannel extends PlatformInterface
    implements Recording {
  RecordingChannel.impl() : super(token: _token);
}
