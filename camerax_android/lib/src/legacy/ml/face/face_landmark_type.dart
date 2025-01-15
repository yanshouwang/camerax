import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension FaceLandmarkTypeObj on $native.FaceLandmarkType {
  $interface.FaceLandmarkType get args {
    switch (this) {
      case $native.FaceLandmarkType.leftCheek:
        return $interface.FaceLandmarkType.leftCheek;
      case $native.FaceLandmarkType.leftEar:
        return $interface.FaceLandmarkType.leftEar;
      case $native.FaceLandmarkType.leftEye:
        return $interface.FaceLandmarkType.leftEye;
      case $native.FaceLandmarkType.mouthBottom:
        return $interface.FaceLandmarkType.mouthBottom;
      case $native.FaceLandmarkType.mouthLeft:
        return $interface.FaceLandmarkType.mouthLeft;
      case $native.FaceLandmarkType.mouthRight:
        return $interface.FaceLandmarkType.mouthRight;
      case $native.FaceLandmarkType.noseBase:
        return $interface.FaceLandmarkType.noseBase;
      case $native.FaceLandmarkType.rightCheek:
        return $interface.FaceLandmarkType.rightCheek;
      case $native.FaceLandmarkType.rightEar:
        return $interface.FaceLandmarkType.rightEar;
      case $native.FaceLandmarkType.rightEye:
        return $interface.FaceLandmarkType.rightEye;
    }
  }
}
