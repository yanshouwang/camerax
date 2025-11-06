import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension IntRectX on Rect<int> {
  RectProxyApi get api =>
      RectProxyApi(left: left, top: top, right: right, bottom: bottom);
}

extension RectProxyApiX on RectProxyApi {
  Rect<int> get impl => Rect(left, top, right, bottom);
}
