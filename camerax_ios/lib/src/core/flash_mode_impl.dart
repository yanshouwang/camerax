import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension FlashModeX on FlashMode {
  FlashModeApi get api {
    switch (this) {
      case FlashMode.auto:
        return FlashModeApi.auto;
      case FlashMode.on:
        return FlashModeApi.on;
      case FlashMode.off:
        return FlashModeApi.off;
      case FlashMode.screen:
        return FlashModeApi.screen;
    }
  }
}

extension FlashModeApiX on FlashModeApi {
  FlashMode get impl {
    switch (this) {
      case FlashModeApi.auto:
        return FlashMode.auto;
      case FlashModeApi.on:
        return FlashMode.on;
      case FlashModeApi.off:
        return FlashMode.off;
      case FlashModeApi.screen:
        return FlashMode.screen;
    }
  }
}
