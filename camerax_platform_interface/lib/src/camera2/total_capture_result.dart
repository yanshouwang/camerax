import 'package:camerax_platform_interface/src/camera2.dart';

abstract interface class TotalCaptureResult implements CaptureResult {
  Future<List<CaptureResult>> getPartialResults();
  Future<Map<String, CaptureResult>> getPhysicalCameraResults();
  Future<Map<String, TotalCaptureResult>> getPhysicalCameraTotalResults();
}
