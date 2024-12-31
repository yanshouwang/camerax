import 'package:camerax_android/src/api.dart' as api;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraSelectorImpl2 extends CameraSelector {
  final api.CameraSelector obj;

  CameraSelectorImpl2.native(this.obj) : super.impl();

  factory CameraSelectorImpl2(LensFacing lensFacing) {
    final obj = api.CameraSelector(
      lensFacing: lensFacing.toNative(),
    );
    return CameraSelectorImpl2.native(obj);
  }
}
