import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camerax_platform_interface/src/common.dart';

import 'image_info.dart';

abstract base class ImageProxyPlaneProxy {
  ImageProxyPlaneProxy.impl();

  int get pixelStride;
  int get rowStride;
  Uint8List get value;
}

abstract base class ImageProxy extends AutoCloseable {
  ImageProxy.impl() : super.impl();

  ImageFormat get format;
  int get width;
  int get height;
  ImageInfo get imageInfo;
  List<ImageProxyPlaneProxy> get planes;

  Future<Rect<int>> getCropRect();
  Future<void> setCropRect(Rect<int>? rect);
  Future<ui.Image> toBitmap();
}
