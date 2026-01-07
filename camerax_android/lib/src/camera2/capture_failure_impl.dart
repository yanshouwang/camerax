import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CaptureFailureImpl implements CaptureFailure {
  final CaptureFailureProxyApi api;

  CaptureFailureImpl.internal(this.api);

  @override
  Future<int> getFrameNumber() => api.getFrameNumber();

  @override
  Future<String?> getPhysicalCameraId() => api.getPhysicalCameraId();

  @override
  Future<CaptureFailure$Reason> getReason() =>
      api.getReason().then((e) => e.impl);

  @override
  Future<CaptureRequest> getRequest() => api.getRequest().then((e) => e.impl);

  @override
  Future<int> getSequenceId() => api.getSequenceId();

  @override
  Future<bool> wasImageCaptured() => api.wasImageCaptured();
}

extension CaptureFailureReasonApiX on CaptureFailureReasonApi {
  CaptureFailure$Reason get impl => CaptureFailure$Reason.values[index];
}

extension CaptureFailureProxyApiX on CaptureFailureProxyApi {
  CaptureFailure get impl => CaptureFailureImpl.internal(this);
}
