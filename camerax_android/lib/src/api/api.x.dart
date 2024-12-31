import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camerax.dart' as api;

extension LensFacingX on LensFacing {
  api.LensFacing toNative() {
    switch (this) {
      case LensFacing.unknown:
        return api.LensFacing.unknown;
      case LensFacing.front:
        return api.LensFacing.front;
      case LensFacing.back:
        return api.LensFacing.back;
      case LensFacing.external:
        return api.LensFacing.external;
    }
  }
}
