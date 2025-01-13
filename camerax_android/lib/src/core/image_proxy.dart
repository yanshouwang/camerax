import 'package:camerax_android/src/jni.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class ImageProxy extends $base.ImageProxy {
  final $native.ImageProxy obj;

  ImageProxy.$native(
    this.obj, {
    required super.format,
    required super.width,
    required super.height,
    required super.imageInfo,
    required super.planes,
  }) : super.impl();

  @override
  Future<void> close() async {
    obj.close();
  }
}
