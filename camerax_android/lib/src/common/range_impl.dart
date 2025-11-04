import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class RangeImpl extends RangeApi {
  final RangeProxyApi api;

  RangeImpl.internal(this.api) : super.impl();

  factory RangeImpl(int lower, int upper) {
    final api = RangeProxyApi(lower: lower, upper: upper);
    return RangeImpl.internal(api);
  }

  @override
  int get lower => api.lower;
  @override
  int get upper => api.upper;
}

extension RangeProxyApiX on RangeProxyApi {
  RangeApi get impl => RangeImpl(lower, upper);
}
