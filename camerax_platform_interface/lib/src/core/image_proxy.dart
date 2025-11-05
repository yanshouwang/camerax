import 'dart:typed_data';

import 'package:camerax_platform_interface/src/common.dart';

import 'image_info.dart';

abstract base class ImageProxyPlaneProxy {
  ImageProxyPlaneProxy.impl({
    required this.pixelStride,
    required this.rowStride,
    required this.value,
  });

  final int pixelStride;
  final int rowStride;
  final Uint8List value;
}

abstract base class ImageProxy extends AutoCloseable {
  ImageProxy.impl({
    required this.format,
    required this.width,
    required this.height,
    required this.imageInfo,
    required this.planes,
  }) : super.impl();

  final ImageFormat format;
  final int width;
  final int height;
  final ImageInfo imageInfo;
  final List<ImageProxyPlaneProxy> planes;

  Future<Rect<int>> getCropRect();
  Future<void> setCropRect(Rect<int>? rect);
  Future<Bitmap> toBitmap();
}
