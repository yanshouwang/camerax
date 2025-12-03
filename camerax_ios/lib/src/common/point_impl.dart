import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension DoublePointX on Point<double> {
  Point<double> get vnFixed {
    // Vision/CoreML 的坐标原点在图像的左下角
    final x = this.x;
    final y = 1.0 - this.y;
    return Point(x, y);
  }
}

extension PointProxyApiX on PointProxyApi {
  Point<int> get impl => Point(x, y);
}

extension PointFProxyApiX on PointFProxyApi {
  Point<double> get impl => Point(x, y);
}
