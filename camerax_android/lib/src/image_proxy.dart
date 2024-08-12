import 'dart:typed_data';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:jni/jni.dart';

import 'jni.g.dart' as jni;

final class MyImageProxy implements ImageProxy {
  final jni.ImageProxy jniValue;
  @override
  final int width;
  @override
  final int height;
  @override
  final Uint8List data;

  MyImageProxy({
    required this.jniValue,
  })  : width = jniValue.getWidth(),
        height = jniValue.getHeight(),
        data = jniValue.getPlanes()[0].getBuffer().asUint8List();

  @override
  Future<void> close() async {
    jniValue.close();
    jniValue.release();
  }
}
