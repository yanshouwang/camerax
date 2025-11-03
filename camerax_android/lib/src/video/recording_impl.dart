import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class RecordingImpl extends Recording with AutoCloseableImpl {
  @override
  final RecordingApi api;

  RecordingImpl.internal(this.api) : super.impl();

  @override
  Future<void> mute(bool muted) => api.mute(muted);

  @override
  Future<void> pause() => api.pause();

  @override
  Future<void> resume() => api.resume();

  @override
  Future<void> stop() => api.stop();
}

extension RecordingApiX on RecordingApi {
  RecordingImpl get impl {
    return RecordingImpl.internal(this);
  }
}
