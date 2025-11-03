import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'image_info_impl.dart';

final class ImageProxyImpl extends ImageProxy with AutoCloseableImpl {
  @override
  final ImageProxyApi api;

  ImageProxyImpl.internal(this.api)
    : super.impl(
        format: api.format.impl,
        width: api.width,
        height: api.height,
        imageInfo: api.imageInfo.impl,
        planes: api.planes.map((e) => e.impl).toList(),
      );
}

extension ImageProxyPlaneProxyApiX on ImageProxyPlaneProxyApi {
  ImageProxyPlaneProxy get impl => ImageProxyPlaneProxy(
    value: value,
    pixelStride: pixelStride,
    rowStride: rowStride,
  );
}

extension ImageProxyApiX on ImageProxyApi {
  ImageProxy get impl {
    return ImageProxyImpl.internal(this);
  }
}
