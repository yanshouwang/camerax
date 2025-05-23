import 'dart:math';

import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'image_format_impl.dart';
import 'image_info_impl.dart';

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
  Future<ImageProxy> impl() async {
    final format = this.format.impl;
    final width = this.width;
    final height = this.height;
    final imageInfo = this.imageInfo.impl;
    final planes = await Stream.fromIterable(this.planes).asyncMap((e) async {
      final buffer = e.buffer;
      final pixelStride = e.pixelStride;
      final rowStride = e.rowStride;
      final value = await buffer.get(width, height, pixelStride, rowStride);
      return PlaneProxy(
        value: value,
        pixelStride: pixelStride,
        rowStride: width * pixelStride,
      );
    }).toList();
    return ImageProxyImpl.impl(
      this,
      format: format,
      width: width,
      height: height,
      imageInfo: imageInfo,
      planes: planes,
    );
  }
}
