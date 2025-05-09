import 'dart:typed_data';

import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

typedef JpegConsumer = void Function(Uint8List value);

final _token = Object();

abstract interface class JpegAnalyzer implements Analyzer {
  factory JpegAnalyzer({
    required CoordinateSystem targetCoordinateSystem,
    required JpegConsumer consumer,
  }) {
    final instance = CameraXPlugin.instance.newJpegAnalyzer(
      targetCoordinateSystem: targetCoordinateSystem,
      consumer: consumer,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class JpegAnalyzerChannel extends PlatformInterface
    implements JpegAnalyzer {
  JpegAnalyzerChannel.impl() : super(token: _token);
}
