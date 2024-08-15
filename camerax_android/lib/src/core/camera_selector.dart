import 'package:camerax_android/src/jni.dart' as jni;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MyCameraSelector implements CameraSelector {
  final jni.CameraSelector jniValue;

  MyCameraSelector.jni(this.jniValue);

  factory MyCameraSelector({
    LensFacing? lensFacing,
  }) {
    final builder = jni.CameraSelector_Builder();
    if (lensFacing != null) {
      builder.requireLensFacing(lensFacing.jniValue);
    }
    final cameraSelector = builder.build();
    return MyCameraSelector.jni(cameraSelector);
  }
}
