import 'package:camerax_platform_interface/src/camera2.dart';

enum CaptureFailure$Reason { error, flushed }

abstract interface class CaptureFailure {
  Future<int> getFrameNumber();
  Future<String?> getPhysicalCameraId();
  Future<CaptureFailure$Reason> getReason();
  Future<CaptureRequest> getRequest();
  Future<int> getSequenceId();
  Future<bool> wasImageCaptured();
}
