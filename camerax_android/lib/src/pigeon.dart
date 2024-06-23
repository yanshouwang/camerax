import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'pigeon.g.dart';

extension CameraSelectorX on CameraSelector {
  CameraSelectorArgs toArgs() {
    return CameraSelectorArgs(
      lensFacingArgs: lensFacing.toArgs(),
    );
  }
}

extension LensFacingX on LensFacing {
  LensFacingArgs toArgs() {
    switch (this) {
      case LensFacing.front:
        return LensFacingArgs.front;
      case LensFacing.back:
        return LensFacingArgs.back;
      case LensFacing.external:
        return LensFacingArgs.external;
    }
  }
}

extension ScaleTypeX on ScaleType {
  ScaleTypeArgs toArgs() {
    switch (this) {
      case ScaleType.fillCenter:
        return ScaleTypeArgs.fillCenter;
      case ScaleType.fillEnd:
        return ScaleTypeArgs.fillEnd;
      case ScaleType.fillStart:
        return ScaleTypeArgs.fillStart;
      case ScaleType.fitCenter:
        return ScaleTypeArgs.fitCenter;
      case ScaleType.fitEnd:
        return ScaleTypeArgs.fitEnd;
      case ScaleType.fitStart:
        return ScaleTypeArgs.fitStart;
    }
  }
}
