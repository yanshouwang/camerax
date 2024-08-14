import 'dart:typed_data';

import 'image_info.dart';

abstract interface class ImageProxy {
  Uint8List get rawPixels;
  int get width;
  int get height;
  ImageInfo get imageInfo;

  Future<void> close();
}
