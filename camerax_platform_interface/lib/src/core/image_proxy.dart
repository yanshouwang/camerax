import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

abstract interface class ImageProxyPlaneProxy {
  int get pixelStride;
  int get rowStride;
  Uint8List get value;
}

abstract interface class ImageProxy implements AutoCloseable {
  ImageFormat get format;
  int get width;
  int get height;
  ImageInfo get imageInfo;
  List<ImageProxyPlaneProxy> get planes;

  Future<Rect<int>> getCropRect();
  Future<void> setCropRect(Rect<int>? rect);
  Future<ui.Image> toBitmap();
}
