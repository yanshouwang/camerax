import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension FlashModeX on ImageCaptureFlashMode {
  FlashModeApi get api {
    switch (this) {
      case ImageCaptureFlashMode.auto:
        return FlashModeApi.auto;
      case ImageCaptureFlashMode.on:
        return FlashModeApi.on;
      case ImageCaptureFlashMode.off:
        return FlashModeApi.off;
      case ImageCaptureFlashMode.screen:
        return FlashModeApi.screen;
    }
  }
}

extension FlashModeApiX on FlashModeApi {
  ImageCaptureFlashMode get impl {
    switch (this) {
      case FlashModeApi.auto:
        return ImageCaptureFlashMode.auto;
      case FlashModeApi.on:
        return ImageCaptureFlashMode.on;
      case FlashModeApi.off:
        return ImageCaptureFlashMode.off;
      case FlashModeApi.screen:
        return ImageCaptureFlashMode.screen;
    }
  }
}
