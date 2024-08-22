import 'dart:ui' as ui;

import 'package:camerax_ios_example/models.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/cupertino.dart';

typedef ImageModelCallback = void Function(ImageModel imageModel);

class RawPixelsAnalyzer implements Analyzer {
  final ImageModelCallback onAnalyzed;

  RawPixelsAnalyzer(this.onAnalyzed);

  @override
  void analyze(ImageProxy imageProxy) async {
    try {
      debugPrint('image size ${imageProxy.width} * ${imageProxy.height}');
      final format = imageProxy.format;
      if (format != ImageFormat.rgba_8888) {
        throw ArgumentError.value(format);
      }
      final rawPixels = imageProxy.planeProxies.first.value;
      final buffer = await ui.ImmutableBuffer.fromUint8List(rawPixels);
      final descriptor = ui.ImageDescriptor.raw(
        buffer,
        width: imageProxy.width,
        height: imageProxy.height,
        pixelFormat: ui.PixelFormat.rgba8888,
      );
      final codec = await descriptor.instantiateCodec();
      final frame = await codec.getNextFrame();
      final imageModel = ImageModel(
        image: frame.image,
        rotationDegrees: imageProxy.rotationDegrees,
      );
      onAnalyzed(imageModel);
    } finally {
      imageProxy.close();
    }
  }
}
