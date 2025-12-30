import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/view.dart';

abstract interface class TapToFocusInfo {
  CameraController$TapToFocus get focusState;
  Point<double>? get tapPoint;
}
