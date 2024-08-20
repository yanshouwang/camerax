import 'dart:typed_data';

abstract interface class PlaneProxy {
  int get rowStride;
  int get pixelStride;
  Uint8List get value;
}
