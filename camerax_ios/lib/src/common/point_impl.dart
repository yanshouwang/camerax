import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension PointApiX on PointApi {
  Point<int> get impl => Point(x, y);
}

extension PointFApiX on PointFApi {
  Point<double> get impl => Point(x, y);
}
