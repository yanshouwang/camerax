import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'image_format_impl.dart';
import 'image_info_impl.dart';
import 'plane_proxy_impl.dart';

final class ImageProxyImpl extends ImageProxyChannel {
  final ImageProxyApi api;

  ImageProxyImpl.impl(
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
    return ImageProxyImpl.impl(
      this,
      format: format.impl,
      width: width,
      height: height,
      imageInfo: imageInfo.impl,
      planes: planes.map((plane) => plane.impl).toList(),
    );
  }
}
