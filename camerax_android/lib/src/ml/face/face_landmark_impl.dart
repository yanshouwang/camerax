import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'face_landmark_type_impl.dart';

extension FaceLandmarkApiX on FaceLandmarkApi {
  FaceLandmark get impl {
    return FaceLandmark(
      type: type.impl,
      position: position.impl,
    );
  }
}
