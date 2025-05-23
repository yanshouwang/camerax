import 'dart:typed_data';

final class PlaneProxy {
  final Uint8List value;
  final int pixelStride;
  final int rowStride;

  PlaneProxy({
    required this.value,
    required this.pixelStride,
    required this.rowStride,
  });
}
