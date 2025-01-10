import 'dart:typed_data';

import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class PlaneProxy extends $base.PlaneProxy {
  final $native.PlaneProxy obj;

  PlaneProxy.$native(this.obj) : super.impl();

  @override
  Future<Uint8List> getBuffer() async {
    final value = await obj.getBuffer();
    return value;
  }

  @override
  Future<int> getPixelStride() async {
    final value = obj.getPixelStride();
    return value;
  }

  @override
  Future<int> getRowStride() async {
    final value = await obj.getRowStride();
    return value;
  }
}
