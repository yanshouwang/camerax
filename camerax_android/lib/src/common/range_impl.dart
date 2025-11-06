import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension IntRangeX on Range<int> {
  RangeProxyApi get api => RangeProxyApi(lower: lower, upper: upper);
}

extension RangeProxyApiX on RangeProxyApi {
  Range<int> get impl => Range(lower, upper);
}
