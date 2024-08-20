import 'package:camerax_ios/src/ffi.dart' as ffi;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

class MyRecording implements Recording {
  final ffi.Recording ffiValue;

  MyRecording.ffi(this.ffiValue);

  @override
  void mute(bool muted) {
    throw UnsupportedError('`mute` is unsupported on iOS.');
  }

  @override
  void pause() {
    throw UnsupportedError('`pause` is unsupported on iOS.');
  }

  @override
  void resume() {
    throw UnsupportedError('`resume` is unsupported on iOS.');
  }

  @override
  void stop() {
    ffiValue.stop();
  }
}
