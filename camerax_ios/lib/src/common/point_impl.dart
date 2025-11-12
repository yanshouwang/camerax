import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension PointProxyApiX on PointProxyApi {
  Point<int> get impl => Point(x, y);
}

extension PointFProxyApiX on PointFProxyApi {
  Point<double> get impl => Point(x, y);
}
