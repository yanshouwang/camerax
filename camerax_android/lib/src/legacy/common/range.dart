import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension IntRangeArgs on $base.Range<int> {
  $native.IntRange get obj {
    return $native.IntRange(
      lower: lower,
      upper: upper,
    );
  }
}

extension IntRangeObj on $native.IntRange {
  $base.Range<int> get args {
    return $base.Range(lower, upper);
  }
}
