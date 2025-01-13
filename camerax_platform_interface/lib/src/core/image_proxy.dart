import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'image_format.dart';
import 'image_info.dart';
import 'plane_proxy.dart';

abstract base class ImageProxy extends PlatformInterface {
  static final _token = Object();

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
  }) : super(token: _token);

  Future<void> close();
}
