import 'dart:typed_data';

import 'package:camerax_platform_interface/src/common.dart';

import 'image_info.dart';

final class ImageProxyPlaneProxy {
  final Uint8List value;
  final int pixelStride;
  final int rowStride;

  ImageProxyPlaneProxy({
    required this.value,
    required this.pixelStride,
    required this.rowStride,
  });
}

abstract base class ImageProxy {
  final ImageFormat format;
  final int width;
  final int height;
  final ImageInfo imageInfo;
  final List<ImageProxyPlaneProxy> planes;

  ImageProxy.impl({
    required this.format,
    required this.width,
    required this.height,
    required this.imageInfo,
    required this.planes,
  });

  Future<void> close();
}
