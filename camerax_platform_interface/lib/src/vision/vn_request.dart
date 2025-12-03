import 'vn_observation.dart';

typedef VNRequestCompletionHandler =
    void Function(VNRequest request, Object? error);

abstract base class VNRequest {
  VNRequest.impl();

  Future<bool> getPreferBackgroundProcessing();
  Future<void> setPreferBackgroundProcessing(bool value);
  Future<List<VNObservation>?> getResults();
  Future<void> cancel();
}
