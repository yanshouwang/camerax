import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension LensFacingX on CameraSelectorLensFacing {
  LensFacingApi get api {
    switch (this) {
      case CameraSelectorLensFacing.unknown:
        return LensFacingApi.unknown;
      case CameraSelectorLensFacing.front:
        return LensFacingApi.front;
      case CameraSelectorLensFacing.back:
        return LensFacingApi.back;
      case CameraSelectorLensFacing.external:
        return LensFacingApi.external;
    }
  }
}

extension LensFacingApiX on LensFacingApi {
  CameraSelectorLensFacing get impl {
    switch (this) {
      case LensFacingApi.unknown:
        return CameraSelectorLensFacing.unknown;
      case LensFacingApi.front:
        return CameraSelectorLensFacing.front;
      case LensFacingApi.back:
        return CameraSelectorLensFacing.back;
      case LensFacingApi.external:
        return CameraSelectorLensFacing.external;
    }
  }
}
