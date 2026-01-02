import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class VisionImageImpl implements VisionImage {
  final InputImage inputImage;

  VisionImageImpl.internal(this.inputImage);
}

final class VisionImageChannelImpl extends VisionImageChannel {
  @override
  VisionImage createWithUri(Uri uri) {
    final image = InputImage.fromFilePath(uri);
    return VisionImageImpl.internal(image);
  }

  @override
  VisionImage createWithFile(File file) {
    final image = InputImage.fromFilePath(file.uri);
    return VisionImageImpl.internal(image);
  }
}

extension VisionImageX on VisionImage {
  InputImage get inputImage {
    final image = this;
    if (image is! VisionImageImpl) throw TypeError();
    return image.inputImage;
  }
}
