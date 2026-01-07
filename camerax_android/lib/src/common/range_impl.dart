import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension IntRangeX on Range<int> {
  IntRangeProxyApi get intApi => IntRangeProxyApi(lower: lower, upper: upper);
  LongRangeProxyApi get longApi =>
      LongRangeProxyApi(lower: lower, upper: upper);
}

extension IntRangeProxyApiX on IntRangeProxyApi {
  Range<int> get impl => Range(lower, upper);
}

extension LongRangeProxyApiX on LongRangeProxyApi {
  Range<int> get impl => Range(lower, upper);
}
