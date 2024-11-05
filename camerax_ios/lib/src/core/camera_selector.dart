import 'package:camerax_ios/src/ffi.dart' as ffi;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MyCameraSelector implements CameraSelector {
  final ffi.CameraSelector ffiValue;

  MyCameraSelector.ffi(this.ffiValue);

  factory MyCameraSelector({
    LensFacing? lensFacing,
  }) {
    lensFacing ??= LensFacing.back;
    final ffiCameraSelector =
        ffi.CameraSelector.alloc().initWithLensFacing_(lensFacing.ffiValue);
    return MyCameraSelector.ffi(ffiCameraSelector);
  }

  @override
  LensFacing get lensFacing => ffiValue.lensFacing.dartValue;
}
