import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension BitDepthX on DynamicRangeBitDepth {
  BitDepthApi get api {
    switch (this) {
      case DynamicRangeBitDepth.unspecified:
        return BitDepthApi.bitDepthUnspecified;
      case DynamicRangeBitDepth.eightBit:
        return BitDepthApi.bitDepth8Bit;
      case DynamicRangeBitDepth.tenBit:
        return BitDepthApi.bitDepth10Bit;
    }
  }
}

extension BitDepthApiX on BitDepthApi {
  DynamicRangeBitDepth get impl {
    switch (this) {
      case BitDepthApi.bitDepthUnspecified:
        return DynamicRangeBitDepth.unspecified;
      case BitDepthApi.bitDepth8Bit:
        return DynamicRangeBitDepth.eightBit;
      case BitDepthApi.bitDepth10Bit:
        return DynamicRangeBitDepth.tenBit;
    }
  }
}
