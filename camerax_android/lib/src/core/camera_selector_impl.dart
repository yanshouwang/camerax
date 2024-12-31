import 'package:camerax_android/src/jni.dart' as jni;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraSelectorImpl extends CameraSelector {
  final jni.CameraSelector obj;

  CameraSelectorImpl.native(this.obj) : super.impl();

  factory CameraSelectorImpl({
    LensFacing? lensFacing,
  }) {
    final builderObj = jni.CameraSelector$Builder();
    if (lensFacing != null) {
      final lensFacingObj = lensFacing.toNative();
      builderObj.requireLensFacing(lensFacingObj);
    }
    final obj = builderObj.build();
    return CameraSelectorImpl.native(obj);
  }
}
