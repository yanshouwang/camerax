import 'dart:typed_data';

abstract class ImageProxy {
  Uint8List get data;
  int get width;
  int get height;
  int get rotationDegrees;

  Future<void> close();
}
