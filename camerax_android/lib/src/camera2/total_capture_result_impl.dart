import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/camera2.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class TotalCaptureResultImpl extends CaptureResultImpl
    implements TotalCaptureResult {
  @override
  TotalCaptureResultProxyApi get api {
    final api = super.api;
    if (api is! TotalCaptureResultProxyApi) throw TypeError();
    return api;
  }

  TotalCaptureResultImpl.internal(TotalCaptureResultProxyApi super.api)
    : super.internal();

  @override
  Future<List<CaptureResult>> getPartialResults() =>
      api.getPartialResults().then((e) => e.map((e) => e.impl).toList());

  @override
  Future<Map<String, CaptureResult>> getPhysicalCameraResults() => api
      .getPhysicalCameraResults()
      .then((e) => e.map((k, v) => MapEntry(k, v.impl)));

  @override
  Future<Map<String, TotalCaptureResult>> getPhysicalCameraTotalResults() => api
      .getPhysicalCameraTotalResults()
      .then((e) => e.map((k, v) => MapEntry(k, v.impl)));
}

extension TotalCaptureResultProxyApiX on TotalCaptureResultProxyApi {
  TotalCaptureResult get impl => TotalCaptureResultImpl.internal(this);
}
