import 'dart:typed_data';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:jni/jni.dart';

import 'jni.dart';
import 'jni.g.dart' as jni;

final class MyImageProxy implements ImageProxy {
  final jni.ImageProxy jniValue;
  @override
  final Uint8List rawPixels;
  @override
  final int width;
  @override
  final int height;
  @override
  final ImageInfo imageInfo;

  MyImageProxy({
    required this.jniValue,
  })  : rawPixels = jniValue.getPlanes()[0].getBuffer().asUint8List(),
        width = jniValue.getWidth(),
        height = jniValue.getHeight(),
        imageInfo = jniValue.getImageInfo().dartValue;

  @override
  Future<void> close() async {
    jniValue.close();
    jniValue.release();
  }
}
