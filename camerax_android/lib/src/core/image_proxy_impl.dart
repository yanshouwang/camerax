import 'dart:typed_data';

import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'image_info_impl.dart';

final class ImageProxyPlaneProxyImpl extends ImageProxyPlaneProxyApi {
  final ImageProxyPlaneProxyProxyApi api;

  ImageProxyPlaneProxyImpl.internal(this.api) : super.impl();

  @override
  int get pixelStride => api.pixelStride;
  @override
  int get rowStride => api.rowStride;
  @override
  Uint8List get value => api.value;
}

final class ImageProxyImpl extends ImageProxyApi with AutoCloseableImpl {
  @override
  final ImageProxyProxyApi api;

  ImageProxyImpl.internal(this.api) : super.impl();

  @override
  ImageFormat get format => api.format.impl;
  @override
  int get height => api.height;
  @override
  ImageInfoApi get imageInfo => api.imageInfo.impl;
  @override
  List<ImageProxyPlaneProxyApi> get planes =>
      api.planes.map((e) => e.impl).toList();
  @override
  int get width => api.width;
}

extension ImageProxyPlaneProxyProxyApiX on ImageProxyPlaneProxyProxyApi {
  ImageProxyPlaneProxyApi get impl => ImageProxyPlaneProxyImpl.internal(this);
}

extension ImageProxyProxyApiX on ImageProxyProxyApi {
  ImageProxyApi get impl => ImageProxyImpl.internal(this);
}
