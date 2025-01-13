import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension FaceContourTypeObj on $native.FaceContourType {
  $base.FaceContourType get args {
    switch (this) {
      case $native.FaceContourType.face:
        return $base.FaceContourType.face;
      case $native.FaceContourType.leftCheek:
        return $base.FaceContourType.leftCheek;
      case $native.FaceContourType.leftEye:
        return $base.FaceContourType.leftEye;
      case $native.FaceContourType.leftEyebrowBottom:
        return $base.FaceContourType.leftEyebrowBottom;
      case $native.FaceContourType.leftEyebrowTop:
        return $base.FaceContourType.leftEyebrowTop;
      case $native.FaceContourType.lowerLipBottom:
        return $base.FaceContourType.lowerLipBottom;
      case $native.FaceContourType.lowerLipTop:
        return $base.FaceContourType.lowerLipTop;
      case $native.FaceContourType.noseBottom:
        return $base.FaceContourType.noseBottom;
      case $native.FaceContourType.noseBridge:
        return $base.FaceContourType.noseBridge;
      case $native.FaceContourType.rightCheek:
        return $base.FaceContourType.rightCheek;
      case $native.FaceContourType.rightEye:
        return $base.FaceContourType.rightEye;
      case $native.FaceContourType.rightEyebrowBottom:
        return $base.FaceContourType.rightEyebrowBottom;
      case $native.FaceContourType.rightEyebrowTop:
        return $base.FaceContourType.rightEyebrowTop;
      case $native.FaceContourType.upperLipBottom:
        return $base.FaceContourType.upperLipBottom;
      case $native.FaceContourType.upperLipTop:
        return $base.FaceContourType.upperLipTop;
    }
  }
}
