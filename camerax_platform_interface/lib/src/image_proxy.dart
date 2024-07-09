import 'dart:typed_data';

abstract class ImageProxy {
  final int width;
  final int height;
  final Uint8List data;

  ImageProxy({
    required this.width,
    required this.height,
    required this.data,
  });

  void close();
}
