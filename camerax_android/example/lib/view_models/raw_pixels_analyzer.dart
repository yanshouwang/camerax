import 'dart:ui' as ui;

import 'package:camerax_android_example/models.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/cupertino.dart';

typedef ImageModelCallback = void Function(ImageModel imageModel);

final class RawPixelsAnalyzer extends Analyzer {
  final ImageModelCallback onAnalyzed;

  RawPixelsAnalyzer(this.onAnalyzed) : super.impl();

  @override
  void analyze(ImageProxy image) async {
    try {
      final format = await image.getFormat();
      final width = await image.getWidth();
      final height = await image.getHeight();
      final planes = await image.getPlanes();
      final rotationDegrees = await image.getRotationDegrees();
      debugPrint('image size: $width * $height');
      if (format != ImageFormat.rgba8888) {
        throw ArgumentError.value(format);
      }
      final rawPixels = await planes.first.getBuffer();
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
      onAnalyzed(imageModel);
    } finally {
      image.close();
    }
  }
}
