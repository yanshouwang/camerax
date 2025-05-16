import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension MirrorModeX on MirrorMode {
  MirrorModeApi get api {
    switch (this) {
      case MirrorMode.off:
        return MirrorModeApi.off;
      case MirrorMode.on:
        return MirrorModeApi.on;
      case MirrorMode.onFrontOnly:
        return MirrorModeApi.onFrontOnly;
    }
  }
}

extension MirrorModeApiX on MirrorModeApi {
  MirrorMode get impl {
    switch (this) {
      case MirrorModeApi.off:
        return MirrorMode.off;
      case MirrorModeApi.on:
        return MirrorMode.on;
      case MirrorModeApi.onFrontOnly:
        return MirrorMode.onFrontOnly;
    }
  }
}
