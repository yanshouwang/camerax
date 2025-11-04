import 'dart:typed_data';

import 'package:camerax_platform_interface/src/common.dart';

import 'image_info_api.dart';

abstract base class ImageProxyPlaneProxyApi {
  ImageProxyPlaneProxyApi.impl();

  Uint8List get value;
  int get pixelStride;
  int get rowStride;
}

abstract base class ImageProxyApi extends AutoCloseableApi {
  ImageProxyApi.impl() : super.impl();

  ImageFormat get format;
  int get width;
  int get height;
  ImageInfoApi get imageInfo;
  List<ImageProxyPlaneProxyApi> get planes;
}
