import 'dart:typed_data';

abstract interface class ImageProxy {
  int get width;
  int get height;
  Uint8List get data;

  Future<void> close();
}
