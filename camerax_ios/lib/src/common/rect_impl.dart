import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension IntRectX on Rect<int> {
  RectProxyApi get api =>
      RectProxyApi(left: left, top: top, right: right, bottom: bottom);
}

extension DoubleRectX on Rect<double> {
  RectFProxyApi get api =>
      RectFProxyApi(left: left, top: top, right: right, bottom: bottom);

  Rect<double> get vnFixed {
    // Vision/CoreML 的坐标原点在图像的左下角
    final left = this.left;
    final top = 1.0 - this.top;
    final right = this.right;
    final bottom = 1.0 - this.bottom;
    return Rect(left, top, right, bottom);
  }
}

extension RectProxyApiX on RectProxyApi {
  Rect<int> get impl => Rect(left, top, right, bottom);
}

extension RectFProxyApiX on RectFProxyApi {
  Rect<double> get impl => Rect(left, top, right, bottom);
}
