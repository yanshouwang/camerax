import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension RectApiX on RectApi {
  Rect<int> get impl => Rect(left, top, right, bottom);
}
