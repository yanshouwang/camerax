import 'dart:typed_data';

import 'image_format.dart';
import 'image_info.dart';

abstract base class ImageProxy {
  final ImageFormat format;
  final int width;
  final int height;
  final ImageInfo imageInfo;
  final List<PlaneProxy> planes;

  ImageProxy.impl({
    required this.format,
    required this.width,
    required this.height,
    required this.imageInfo,
    required this.planes,
  });

  Future<void> close();
}

final class PlaneProxy {
  final Uint8List value;
  final int pixelStride;
  final int rowStride;

  PlaneProxy({
    required this.value,
    required this.pixelStride,
    required this.rowStride,
  });
}
