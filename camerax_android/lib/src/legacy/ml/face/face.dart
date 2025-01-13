import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'face_contour.dart';
import 'face_landmark.dart';

extension FaceObj on $native.Face {
  $base.Face get args {
    return $base.Face(
      boundingBox: boundingBox.args,
      allContours: allContours.map((contour) => contour.args).toList(),
      allLandmarks: allLandmarks.map((landmark) => landmark.args).toList(),
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