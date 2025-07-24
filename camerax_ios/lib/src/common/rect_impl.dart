import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension RectApiX on RectApi {
  Rect<int> get impl => Rect(left, top, right, bottom);
}

extension RectFApiX on RectFApi {
  Rect<double> get impl => Rect(left, top, right, bottom);
}
