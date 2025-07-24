import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension RangeX on Range<int> {
  RangeApi get api {
    return RangeApi(
      lower: lower,
      upper: upper,
    );
  }
}

extension RangeApiX on RangeApi {
  Range<int> get impl {
    return Range(lower, upper);
  }
}
