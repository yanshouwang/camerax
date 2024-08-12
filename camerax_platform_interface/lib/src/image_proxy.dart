import 'dart:typed_data';

abstract interface class ImageProxy {
  Uint8List get data;
  int get width;
  int get height;

  Future<void> close();
}
