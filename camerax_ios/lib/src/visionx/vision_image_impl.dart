import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class VisionImageImpl extends VisionImage {
  final VNImageRequestHandler handler;

  VisionImageImpl.internal(this.handler) : super.impl();

  factory VisionImageImpl.uri(Uri uri) {
    final handler = VNImageRequestHandler.uri(uri);
    return VisionImageImpl.internal(handler);
  }

  factory VisionImageImpl.file(File file) {
    final handler = VNImageRequestHandler.uri(file.uri);
    return VisionImageImpl.internal(handler);
  }
}

extension VisionImageX on VisionImage {
  VNImageRequestHandler get handler {
    final impl = this;
    if (impl is! VisionImageImpl) throw TypeError();
    return impl.handler;
  }
}
