import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'face_contour_type_impl.dart';

extension FaceContourApiX on FaceContourApi {
  FaceContour get impl {
    return FaceContour(
      type: type.impl,
      points: points.map((e) => e.impl).toList(),
    );
  }
}
