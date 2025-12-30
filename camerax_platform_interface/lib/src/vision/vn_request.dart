import 'package:camerax_platform_interface/src/vision.dart';

typedef VNRequestCompletionHandler =
    void Function(VNRequest request, Object? error);

abstract interface class VNRequest {
  Future<bool> getPreferBackgroundProcessing();
  Future<void> setPreferBackgroundProcessing(bool value);
  Future<List<VNObservation>?> getResults();
  Future<void> cancel();
}
