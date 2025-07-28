import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension RangeX on Range<int> {
  IntRangeApi get intApi {
    return IntRangeApi(lower: lower, upper: upper);
  }

  LongRangeApi get longApi {
    return LongRangeApi(lower: lower, upper: upper);
  }
}

extension IntRangeApiX on IntRangeApi {
  Range<int> get impl {
    return Range(lower, upper);
  }
}

extension LongRangeApiX on LongRangeApi {
  Range<int> get impl {
    return Range(lower, upper);
  }
}
