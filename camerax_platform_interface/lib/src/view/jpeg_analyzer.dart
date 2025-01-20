import 'dart:typed_data';

import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:camerax_platform_interface/src/core.dart';

typedef JpegConsumer = void Function(Uint8List value);

abstract base class JpegAnalyzer extends Analyzer {
  JpegAnalyzer.impl() : super.impl();

  factory JpegAnalyzer({
    required CoordinateSystem targetCoordinateSystem,
    required JpegConsumer consumer,
  }) {
    return CameraX.instance.createJpegAnalyzer(
      targetCoordinateSystem: targetCoordinateSystem,
      consumer: consumer,
    );
  }
}
