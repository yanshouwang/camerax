import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:jni/jni.dart';

import 'jni.g.dart' as jni;

final class ImageProxyImpl extends ImageProxy {
  final jni.ImageProxy jniValue;

  ImageProxyImpl({
    required this.jniValue,
  }) : super(
          width: jniValue.getWidth(),
          height: jniValue.getHeight(),
          data: jniValue.getPlanes()[0].getBuffer().asUint8List(),
        );

  @override
  void close() {
    jniValue.close();
  }
}
