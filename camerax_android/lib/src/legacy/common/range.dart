import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension IntRangeArgs on $interface.Range<int> {
  $native.IntRange get obj {
    return $native.IntRange(
      lower: lower,
      upper: upper,
    );
  }
}

extension IntRangeObj on $native.IntRange {
  $interface.Range<int> get args {
    return $interface.Range(lower, upper);
  }
}
