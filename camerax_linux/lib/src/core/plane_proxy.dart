import 'dart:typed_data';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

class PlaneProxyImpl implements PlaneProxy {
  @override
  final int rowStride;
  @override
  final int pixelStride;
  @override
  final Uint8List value;

  PlaneProxyImpl({
    required this.rowStride,
    required this.pixelStride,
    required this.value,
  });
}
