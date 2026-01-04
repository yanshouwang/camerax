import 'package:camerax_platform_interface/src/camera2.dart';

abstract interface class TotalCaptureResult implements CaptureResult {
  Future<List<CaptureResult>> getPartialResults();
  @Deprecated(
    "Please use getPhysicalCameraTotalResults() instead to get the physical cameras' TotalCaptureResult.",
  )
  Future<Map<String, CaptureResult>> getPhysicalCameraResults();
  Future<Map<String, TotalCaptureResult>> getPhysicalCameraTotalResults();
}
