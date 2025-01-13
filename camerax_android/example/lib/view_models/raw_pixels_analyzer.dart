import 'dart:ui' as ui;

import 'package:camerax_android_example/models.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/cupertino.dart';

typedef ImageModelCallback = void Function(ImageModel imageModel);

Analyzer rawPixelsAnalyzer(ImageModelCallback callback) {
  return Analyzer((image) async {
    try {
      final format = image.format;
      final width = image.width;
      final height = image.height;
      final planes = image.planes;
      final rotationDegrees = image.imageInfo.rotationDegrees;
      debugPrint('image size: $width * $height');
      if (format != ImageFormat.rgba8888) {
        throw ArgumentError.value(format);
      }
      final rawPixels = planes.first.buffer;
      final buffer = await ui.ImmutableBuffer.fromUint8List(rawPixels);
      final descriptor = ui.ImageDescriptor.raw(
        buffer,
        width: width,
        height: height,
        pixelFormat: ui.PixelFormat.rgba8888,
      );
      final codec = await descriptor.instantiateCodec();
      final frame = await codec.getNextFrame();
      final imageModel = ImageModel(
        image: frame.image,
        rotationDegrees: rotationDegrees,
      );
      callback(imageModel);
    } finally {
      image.close();
    }
  });
}
