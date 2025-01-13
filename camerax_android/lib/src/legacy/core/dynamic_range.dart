import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'bit_depth.dart';
import 'encoding.dart';

extension DynamicRangeArgs on $base.DynamicRange {
  $native.DynamicRange get obj {
    return $native.DynamicRange(
      encoding: encoding.obj,
      bitDepth: bitDepth.obj,
    );
  }
}

extension DynamicRangeObj on $native.DynamicRange {
  $base.DynamicRange get args {
    return $base.DynamicRange(
      encoding: encoding.args,
      bitDepth: bitDepth.args,
    );
  }
}
