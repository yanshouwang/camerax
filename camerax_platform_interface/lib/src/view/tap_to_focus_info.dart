import 'package:camerax_platform_interface/src/common.dart';

import 'camera_controller.dart';

abstract base class TapToFocusInfo {
  TapToFocusInfo.impl();

  CameraControllerTapToFocus get focusState;
  Point<double>? get tapPoint;
}
