import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension FaceLandmarkTypeObj on $native.FaceLandmarkType {
  $base.FaceLandmarkType get args {
    switch (this) {
      case $native.FaceLandmarkType.leftCheek:
        return $base.FaceLandmarkType.leftCheek;
      case $native.FaceLandmarkType.leftEar:
        return $base.FaceLandmarkType.leftEar;
      case $native.FaceLandmarkType.leftEye:
        return $base.FaceLandmarkType.leftEye;
      case $native.FaceLandmarkType.mouthBottom:
        return $base.FaceLandmarkType.mouthBottom;
      case $native.FaceLandmarkType.mouthLeft:
        return $base.FaceLandmarkType.mouthLeft;
      case $native.FaceLandmarkType.mouthRight:
        return $base.FaceLandmarkType.mouthRight;
      case $native.FaceLandmarkType.noseBase:
        return $base.FaceLandmarkType.noseBase;
      case $native.FaceLandmarkType.rightCheek:
        return $base.FaceLandmarkType.rightCheek;
      case $native.FaceLandmarkType.rightEar:
        return $base.FaceLandmarkType.rightEar;
      case $native.FaceLandmarkType.rightEye:
        return $base.FaceLandmarkType.rightEye;
    }
  }
}
