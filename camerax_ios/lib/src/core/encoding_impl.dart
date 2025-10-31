import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension EncodingX on DynamicRangeEncoding {
  EncodingApi get api {
    switch (this) {
      case DynamicRangeEncoding.unspecified:
        return EncodingApi.unspecified;
      case DynamicRangeEncoding.sdr:
        return EncodingApi.sdr;
      case DynamicRangeEncoding.hdrUnspecified:
        return EncodingApi.hdrUnspecified;
      case DynamicRangeEncoding.hlg:
        return EncodingApi.hlg;
      case DynamicRangeEncoding.hdr10:
        return EncodingApi.hdr10;
      case DynamicRangeEncoding.hdr10Plus:
        return EncodingApi.hdr10Plus;
      case DynamicRangeEncoding.dolbyVision:
        return EncodingApi.dolbyVision;
    }
  }
}

extension EncodingApiX on EncodingApi {
  DynamicRangeEncoding get impl {
    switch (this) {
      case EncodingApi.unspecified:
        return DynamicRangeEncoding.unspecified;
      case EncodingApi.sdr:
        return DynamicRangeEncoding.sdr;
      case EncodingApi.hdrUnspecified:
        return DynamicRangeEncoding.hdrUnspecified;
      case EncodingApi.hlg:
        return DynamicRangeEncoding.hlg;
      case EncodingApi.hdr10:
        return DynamicRangeEncoding.hdr10;
      case EncodingApi.hdr10Plus:
        return DynamicRangeEncoding.hdr10Plus;
      case EncodingApi.dolbyVision:
        return DynamicRangeEncoding.dolbyVision;
    }
  }
}
