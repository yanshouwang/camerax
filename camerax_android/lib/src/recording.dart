import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'jni.g.dart' as jni;

class MyRecording implements Recording {
  final jni.Recording jniValue;

  MyRecording(this.jniValue);

  @override
  void mute(bool muted) {
    jniValue.mute(muted);
  }

  @override
  void pause() {
    jniValue.pause();
  }

  @override
  void resume() {
    jniValue.resume();
  }

  @override
  void stop() {
    jniValue.stop();
  }
}
