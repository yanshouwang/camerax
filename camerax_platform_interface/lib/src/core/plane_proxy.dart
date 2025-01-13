import 'dart:typed_data';

final class PlaneProxy {
  final Uint8List buffer;
  final int pixelStride;
  final int rowStride;

  PlaneProxy({
    required this.buffer,
    required this.pixelStride,
    required this.rowStride,
  });
}
