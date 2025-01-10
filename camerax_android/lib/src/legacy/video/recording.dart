import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class Recording extends $base.Recording {
  final $native.Recording obj;

  Recording.$native(this.obj) : super.impl();

  @override
  Future<void> close() async {
    await obj.close();
  }

  @override
  Future<void> mute(bool muted) async {
    await obj.mute(muted);
  }

  @override
  Future<void> pause() async {
    await obj.pause();
  }

  @override
  Future<void> resume() async {
    await obj.resume();
  }

  @override
  Future<void> stop() async {
    await obj.stop();
  }
}
