import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'image_info_impl.dart';

final class ImageProxyImpl extends ImageProxy {
  final ImageProxyApi api;

  ImageProxyImpl.internal(this.api)
    : super.impl(
        format: api.format.impl,
        width: api.width,
        height: api.height,
        imageInfo: api.imageInfo.impl,
        planes: api.planes.map((e) => e.impl).toList(),
      );

  @override
  Future<void> close() => api.close();
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
