import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class RecordingImpl extends AutoCloseableImpl implements Recording {
  @override
  final RecordingProxyApi api;

  RecordingImpl.internal(this.api);

  @override
  Future<bool> isPersistent() => api.isPersistent();

  @override
  Future<void> mute(bool muted) => api.mute(muted);

  @override
  Future<void> pause() => api.pause();

  @override
  Future<void> resume() => api.resume();

  @override
  Future<void> stop() => api.stop();
}

extension RecordingProxyApiX on RecordingProxyApi {
  RecordingImpl get impl => RecordingImpl.internal(this);
}
