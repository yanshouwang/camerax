import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ImageProxy$PlaneProxyImpl implements ImageProxy$PlaneProxy {
  final ImageProxyPlaneProxyProxyApi api;

  ImageProxy$PlaneProxyImpl.internal(this.api);

  @override
  int get pixelStride => api.pixelStride;
  @override
  int get rowStride => api.rowStride;
  @override
  Uint8List get value => api.value;
}

final class ImageProxyImpl extends AutoCloseableImpl implements ImageProxy {
  @override
  final ImageProxyProxyApi api;

  ImageProxyImpl.internal(this.api);

  @override
  ImageFormat get format => api.format.impl;
  @override
  int get height => api.height;
  @override
  ImageInfo get imageInfo => api.imageInfo.impl;
  @override
  List<ImageProxy$PlaneProxy> get planes =>
      api.planes.map((e) => e.impl).toList();
  @override
  int get width => api.width;

  @override
  Future<Rect<int>> getCropRect() => api.getCropRect().then((e) => e.impl);

  @override
  Future<void> setCropRect(Rect<int>? rect) => api.setCropRect(rect?.api);

  @override
  Future<ui.Image> toBitmap() => api.toBitmap().then((e) => e.impl());
}

extension ImageProxyPlaneProxyProxyApiX on ImageProxyPlaneProxyProxyApi {
  ImageProxy$PlaneProxy get impl => ImageProxy$PlaneProxyImpl.internal(this);
}

extension ImageProxyX on ImageProxy {
  ImageProxyProxyApi get api {
    final impl = this;
    if (impl is! ImageProxyImpl) throw TypeError();
    return impl.api;
  }
}

extension ImageProxyProxyApiX on ImageProxyProxyApi {
  ImageProxy get impl => ImageProxyImpl.internal(this);
}
