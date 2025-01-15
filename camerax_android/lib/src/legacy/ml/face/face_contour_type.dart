import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension FaceContourTypeObj on $native.FaceContourType {
  $interface.FaceContourType get args {
    switch (this) {
      case $native.FaceContourType.face:
        return $interface.FaceContourType.face;
      case $native.FaceContourType.leftCheek:
        return $interface.FaceContourType.leftCheek;
      case $native.FaceContourType.leftEye:
        return $interface.FaceContourType.leftEye;
      case $native.FaceContourType.leftEyebrowBottom:
        return $interface.FaceContourType.leftEyebrowBottom;
      case $native.FaceContourType.leftEyebrowTop:
        return $interface.FaceContourType.leftEyebrowTop;
      case $native.FaceContourType.lowerLipBottom:
        return $interface.FaceContourType.lowerLipBottom;
      case $native.FaceContourType.lowerLipTop:
        return $interface.FaceContourType.lowerLipTop;
      case $native.FaceContourType.noseBottom:
        return $interface.FaceContourType.noseBottom;
      case $native.FaceContourType.noseBridge:
        return $interface.FaceContourType.noseBridge;
      case $native.FaceContourType.rightCheek:
        return $interface.FaceContourType.rightCheek;
      case $native.FaceContourType.rightEye:
        return $interface.FaceContourType.rightEye;
      case $native.FaceContourType.rightEyebrowBottom:
        return $interface.FaceContourType.rightEyebrowBottom;
      case $native.FaceContourType.rightEyebrowTop:
        return $interface.FaceContourType.rightEyebrowTop;
      case $native.FaceContourType.upperLipBottom:
        return $interface.FaceContourType.upperLipBottom;
      case $native.FaceContourType.upperLipTop:
        return $interface.FaceContourType.upperLipTop;
    }
  }
}
