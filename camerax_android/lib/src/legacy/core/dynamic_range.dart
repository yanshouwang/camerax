import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'bit_depth.dart';
import 'encoding.dart';

extension DynamicRangeArgs on $interface.DynamicRange {
  $native.DynamicRange get obj {
    return $native.DynamicRange(
      encoding: encoding.obj,
      bitDepth: bitDepth.obj,
    );
  }
}

extension DynamicRangeObj on $native.DynamicRange {
  $interface.DynamicRange get args {
    return $interface.DynamicRange(
      encoding: encoding.args,
      bitDepth: bitDepth.args,
    );
  }
}
