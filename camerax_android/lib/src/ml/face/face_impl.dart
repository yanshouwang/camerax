import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'face_contour_impl.dart';
import 'face_landmark_impl.dart';

extension FaceApiX on FaceApi {
  Face get impl {
    return Face(
      boundingBox: boundingBox.impl,
      allContours: allContours.map((e) => e.impl).toList(),
      allLandmarks: allLandmarks.map((e) => e.impl).toList(),
      headEulerAngleX: headEulerAngleX,
      headEulerAngleY: headEulerAngleY,
      headEulerAngleZ: headEulerAngleZ,
      leftEyeOpenProbability: leftEyeOpenProbability,
      rightEyeOpenProbability: rightEyeOpenProbability,
      smilingProbability: smilingProbability,
      trackingId: trackingId,
    );
  }
}
