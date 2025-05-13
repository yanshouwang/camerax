import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension RectApiX on RectApi {
  Rect get impl {
    return Rect(left, top, right, bottom);
  }
}
