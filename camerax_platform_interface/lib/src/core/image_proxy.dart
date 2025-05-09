import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'image_format.dart';
import 'image_info.dart';
import 'plane_proxy.dart';

final _token = Object();

abstract interface class ImageProxy {
  ImageFormat get format;
  int get width;
  int get height;
  ImageInfo get imageInfo;
  List<PlaneProxy> get planes;

  Future<void> close();
}

abstract base class ImageProxyChannel extends PlatformInterface
    implements ImageProxy {
  @override
  final ImageFormat format;
  @override
  final int width;
  @override
  final int height;
  @override
  final ImageInfo imageInfo;
  @override
  final List<PlaneProxy> planes;

  ImageProxyChannel.impl({
    required this.format,
    required this.width,
    required this.height,
    required this.imageInfo,
    required this.planes,
  }) : super(token: _token);
}
