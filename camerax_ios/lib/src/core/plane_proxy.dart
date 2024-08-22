import 'dart:typed_data';

import 'package:camerax_ios/src/ffi.dart' as ffi;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:objective_c/objective_c.dart';

final class MyPlaneProxy implements PlaneProxy {
  final ffi.PlaneProxy ffiValue;

  MyPlaneProxy.ffi(this.ffiValue);

  @override
  int get rowStride => ffiValue.rowStride;

  @override
  int get pixelStride => ffiValue.pixelStride;

  @override
  Uint8List get value => ffiValue.value.toList();
}
