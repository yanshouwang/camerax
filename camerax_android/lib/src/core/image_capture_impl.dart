import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ImageCaptureCaptureModeX on ImageCaptureCaptureMode {
  ImageCaptureCaptureModeApi get api =>
      ImageCaptureCaptureModeApi.values[index];
}

extension ImageCaptureCaptureModeApiX on ImageCaptureCaptureModeApi {
  ImageCaptureCaptureMode get impl => ImageCaptureCaptureMode.values[index];
}

extension ImageCaptureFlashModeX on ImageCaptureFlashMode {
  ImageCaptureFlashModeApi get api => ImageCaptureFlashModeApi.values[index];
}

extension ImageCaptureFlashModeApiX on ImageCaptureFlashModeApi {
  ImageCaptureFlashMode get impl => ImageCaptureFlashMode.values[index];
}
