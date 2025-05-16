import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension LensFacingX on LensFacing {
  LensFacingApi get api {
    switch (this) {
      case LensFacing.unknown:
        return LensFacingApi.unknown;
      case LensFacing.front:
        return LensFacingApi.front;
      case LensFacing.back:
        return LensFacingApi.back;
      case LensFacing.external:
        return LensFacingApi.external;
    }
  }
}

extension LensFacingApiX on LensFacingApi {
  LensFacing get impl {
    switch (this) {
      case LensFacingApi.unknown:
        return LensFacing.unknown;
      case LensFacingApi.front:
        return LensFacing.front;
      case LensFacingApi.back:
        return LensFacing.back;
      case LensFacingApi.external:
        return LensFacing.external;
    }
  }
}
