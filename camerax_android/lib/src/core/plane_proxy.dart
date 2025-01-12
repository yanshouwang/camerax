import 'dart:typed_data';

import 'package:camerax_android/src/jni.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class MyPlaneProxy extends $base.PlaneProxy {
  final $native.ImageProxy$PlaneProxy obj;

  MyPlaneProxy.$native(this.obj) : super.impl();

  @override
  Future<Uint8List> getBuffer() async {
    return obj.getBuffer().asUint8List(
          releaseOriginal: true,
        );
  }

  @override
  Future<int> getPixelStride() async {
    return obj.getPixelStride();
  }

  @override
  Future<int> getRowStride() async {
    return obj.getRowStride();
  }
}
