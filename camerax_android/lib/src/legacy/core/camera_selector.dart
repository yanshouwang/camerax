import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class CameraSelector extends $interface.CameraSelector {
  static CameraSelector get front =>
      CameraSelector.$native($native.CameraSelector.front);
  static CameraSelector get back =>
      CameraSelector.$native($native.CameraSelector.back);
  static CameraSelector get external =>
      CameraSelector.$native($native.CameraSelector.external);

  final $native.CameraSelector obj;

  CameraSelector.$native(this.obj) : super.impl();

  factory CameraSelector({
    $interface.LensFacing? lensFacing,
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

extension on $interface.LensFacing {
  $native.LensFacing get obj {
    switch (this) {
      case $interface.LensFacing.unknown:
        return $native.LensFacing.unknown;
      case $interface.LensFacing.front:
        return $native.LensFacing.front;
      case $interface.LensFacing.back:
        return $native.LensFacing.back;
      case $interface.LensFacing.external:
        return $native.LensFacing.external;
    }
  }
}
