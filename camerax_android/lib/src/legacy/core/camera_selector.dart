import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class CameraSelector extends $base.CameraSelector {
  static CameraSelector get front =>
      CameraSelector.$native($native.CameraSelector.front);
  static CameraSelector get back =>
      CameraSelector.$native($native.CameraSelector.back);
  static CameraSelector get external =>
      CameraSelector.$native($native.CameraSelector.external);

  final $native.CameraSelector obj;

  CameraSelector.$native(this.obj) : super.impl();

  factory CameraSelector({
    $base.LensFacing? lensFacing,
  }) {
    final obj = $native.CameraSelector(
      lensFacing: lensFacing?.obj,
    );
    return CameraSelector.$native(obj);
  }

  @override
  int get hashCode => obj.hashCode;

  @override
  bool operator ==(Object other) => other is CameraSelector && obj == other.obj;
}

extension BaseLensFacing on $base.LensFacing {
  $native.LensFacing get obj {
    switch (this) {
      case $base.LensFacing.unknown:
        return $native.LensFacing.unknown;
      case $base.LensFacing.front:
        return $native.LensFacing.front;
      case $base.LensFacing.back:
        return $native.LensFacing.back;
      case $base.LensFacing.external:
        return $native.LensFacing.external;
    }
  }
}

extension NativeLensFacing on $native.LensFacing {
  $base.LensFacing get args {
    switch (this) {
      case $native.LensFacing.unknown:
        return $base.LensFacing.unknown;
      case $native.LensFacing.front:
        return $base.LensFacing.front;
      case $native.LensFacing.back:
        return $base.LensFacing.back;
      case $native.LensFacing.external:
        return $base.LensFacing.external;
    }
  }
}
