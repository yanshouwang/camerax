import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class RecordingImpl extends Recording {
  final RecordingApi api;

  RecordingImpl.impl(this.api) : super.impl();

  @override
  Future<void> close() => api.close();

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
    return RecordingImpl.impl(this);
  }
}
