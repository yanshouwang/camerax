import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'image_format_impl.dart';
import 'image_info_impl.dart';
import 'plane_proxy_impl.dart';

final class ImageProxyImpl extends ImageProxy {
  final ImageProxyApi api;

  ImageProxyImpl.internal(
    this.api, {
    required super.format,
    required super.width,
    required super.height,
    required super.imageInfo,
    required super.planes,
  }) : super.impl();

  @override
  Future<void> close() => api.close();
}

extension ImageProxyApiX on ImageProxyApi {
  ImageProxy get impl {
    final format = this.format.impl;
    final width = this.width;
    final height = this.height;
    final imageInfo = this.imageInfo.impl;
    final planes = this.planes.map((e) => e.impl).toList();
    return ImageProxyImpl.internal(
      this,
      format: format,
      width: width,
      height: height,
      imageInfo: imageInfo,
      planes: planes,
    );
  }
}
