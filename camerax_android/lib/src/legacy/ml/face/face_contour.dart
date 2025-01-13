import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'face_contour_type.dart';

extension FaceContourObj on $native.FaceContour {
  $base.FaceContour get args {
    return $base.FaceContour(
      type: type.args,
      points: points.map((point) => point.args).toList(),
    );
  }
}
