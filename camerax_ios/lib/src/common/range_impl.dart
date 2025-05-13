import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension IntRangeX on Range<int> {
  IntRangeApi get intRangeApi {
    return IntRangeApi(
      lower: lower,
      upper: upper,
    );
  }

  LongRangeApi get longRangeApi {
    return LongRangeApi(
      lower: lower,
      upper: upper,
    );
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
