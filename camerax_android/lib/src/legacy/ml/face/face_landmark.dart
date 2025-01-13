import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'face_landmark_type.dart';

extension FaceLandmarkObj on $native.FaceLandmark {
  $base.FaceLandmark get args {
    return $base.FaceLandmark(
      type: type.args,
      position: position.args,
    );
  }
}
