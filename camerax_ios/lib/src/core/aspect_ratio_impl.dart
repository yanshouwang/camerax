import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension AspectRatioX on AspectRatio {
  AspectRatioApi get api {
    switch (this) {
      case AspectRatio.ratioDefault:
        return AspectRatioApi.ratioDefault;
      case AspectRatio.ratio4_3:
        return AspectRatioApi.ratio4_3;
      case AspectRatio.ratio16_9:
        return AspectRatioApi.ratio16_9;
    }
  }
}

extension AspectRatioApiX on AspectRatioApi {
  AspectRatio get impl {
    switch (this) {
      case AspectRatioApi.ratioDefault:
        return AspectRatio.ratioDefault;
      case AspectRatioApi.ratio4_3:
        return AspectRatio.ratio4_3;
      case AspectRatioApi.ratio16_9:
        return AspectRatio.ratio16_9;
    }
  }
}
