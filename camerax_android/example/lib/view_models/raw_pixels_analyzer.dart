import 'dart:ui' as ui;

import 'package:camerax_android_example/models.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/cupertino.dart';

typedef ImageWrapperCallback = void Function(ImageWrapper imageWrapper);

class RawPixelsAnalyzer implements Analyzer {
  final ImageWrapperCallback onAnalyzed;

  RawPixelsAnalyzer(this.onAnalyzed);

  @override
  void analyze(ImageProxy imageProxy) async {
    try {
      debugPrint('imageProxy ${imageProxy.width} * ${imageProxy.height}');
      final buffer =
          await ui.ImmutableBuffer.fromUint8List(imageProxy.rawPixels);
      final descriptor = ui.ImageDescriptor.raw(
        buffer,
        width: imageProxy.width,
        height: imageProxy.height,
        pixelFormat: ui.PixelFormat.rgba8888,
      );
      final codec = await descriptor.instantiateCodec();
      final frame = await codec.getNextFrame();
      final imageWrapper = ImageWrapper(
        image: frame.image,
        rotationDegrees: imageProxy.imageInfo.rotationDegrees,
      );
      onAnalyzed(imageWrapper);
    } finally {
      await imageProxy.close();
    }
  }
}
