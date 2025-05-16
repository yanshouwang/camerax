import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension BitDepthX on BitDepth {
  BitDepthApi get api {
    switch (this) {
      case BitDepth.bitDepthUnspecified:
        return BitDepthApi.bitDepthUnspecified;
      case BitDepth.bitDepth8Bit:
        return BitDepthApi.bitDepth8Bit;
      case BitDepth.bitDepth10Bit:
        return BitDepthApi.bitDepth10Bit;
    }
  }
}

extension BitDepthApiX on BitDepthApi {
  BitDepth get impl {
    switch (this) {
      case BitDepthApi.bitDepthUnspecified:
        return BitDepth.bitDepthUnspecified;
      case BitDepthApi.bitDepth8Bit:
        return BitDepth.bitDepth8Bit;
      case BitDepthApi.bitDepth10Bit:
        return BitDepth.bitDepth10Bit;
    }
  }
}
