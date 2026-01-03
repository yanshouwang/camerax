import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class VisionImageImpl implements VisionImage {
  final VNImageRequestHandler handler;

  VisionImageImpl.internal(this.handler);
}

final class VisionImageChannelImpl extends VisionImageChannel {
  @override
  VisionImage createWithUri(Uri uri) {
    final handler = VNImageRequestHandler.uri(uri);
    return VisionImageImpl.internal(handler);
  }

  @override
  VisionImage createWithFile(File file) {
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
