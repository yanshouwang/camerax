import 'package:camerax_android/src/jni.dart' as jni;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MyCameraSelector implements CameraSelector {
  final jni.CameraSelector jniValue;

  MyCameraSelector.jni(this.jniValue);

  factory MyCameraSelector({
    LensFacing? lensFacing,
  }) {
    final jniBuilder = jni.CameraSelector_Builder();
    if (lensFacing != null) {
      jniBuilder.requireLensFacing(lensFacing.jniValue);
    }
    final jniCameraSelector = jniBuilder.build();
    return MyCameraSelector.jni(jniCameraSelector);
  }
}
