import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension IntRectX on Rect<int> {
  RectProxyApi get api =>
      RectProxyApi(left: left, top: top, right: right, bottom: bottom);
}

extension RectProxyApiX on RectProxyApi {
  Rect<int> get impl => Rect(left, top, right, bottom);
}

extension RectFProxyApiX on RectFProxyApi {
  Rect<double> get impl => Rect(left, top, right, bottom);
}
