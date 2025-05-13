import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension EncodingX on Encoding {
  EncodingApi get api {
    switch (this) {
      case Encoding.unspecified:
        return EncodingApi.unspecified;
      case Encoding.sdr:
        return EncodingApi.sdr;
      case Encoding.hdrUnspecified:
        return EncodingApi.hdrUnspecified;
      case Encoding.hlg:
        return EncodingApi.hlg;
      case Encoding.hdr10:
        return EncodingApi.hdr10;
      case Encoding.hdr10Plus:
        return EncodingApi.hdr10Plus;
      case Encoding.dolbyVision:
        return EncodingApi.dolbyVision;
    }
  }
}

extension EncodingApiX on EncodingApi {
  Encoding get impl {
    switch (this) {
      case EncodingApi.unspecified:
        return Encoding.unspecified;
      case EncodingApi.sdr:
        return Encoding.sdr;
      case EncodingApi.hdrUnspecified:
        return Encoding.hdrUnspecified;
      case EncodingApi.hlg:
        return Encoding.hlg;
      case EncodingApi.hdr10:
        return Encoding.hdr10;
      case EncodingApi.hdr10Plus:
        return Encoding.hdr10Plus;
      case EncodingApi.dolbyVision:
        return Encoding.dolbyVision;
    }
  }
}
