import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

class ImageProxyImpl implements ImageProxy {
  @override
  final int timestamp;
  @override
  final ImageFormat format;
  @override
  final int width;
  @override
  final int height;
  @override
  final int rotationDegrees;
  @override
  final List<PlaneProxy> planeProxies;
  final VoidCallback onClosed;

  bool _closed;

  ImageProxyImpl({
    required this.timestamp,
    required this.format,
    required this.width,
    required this.height,
    required this.rotationDegrees,
    required this.planeProxies,
    required this.onClosed,
  }) : _closed = false;

  @override
  void close() {
    final closed = _closed;
    if (closed) {
      return;
    }
    onClosed();
    _closed = true;
  }
}
