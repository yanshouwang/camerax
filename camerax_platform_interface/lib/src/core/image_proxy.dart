import 'image_format.dart';
import 'image_info.dart';
import 'plane_proxy.dart';

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
