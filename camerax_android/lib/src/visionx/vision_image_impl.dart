import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class VisionImageImpl extends VisionImage {
  final InputImage inputImage;

  VisionImageImpl.internal(this.inputImage) : super.impl();

  factory VisionImageImpl.uri(Uri uri) {
    final image = InputImage.fromFilePath(uri);
    return VisionImageImpl.internal(image);
  }

  factory VisionImageImpl.file(File file) {
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
