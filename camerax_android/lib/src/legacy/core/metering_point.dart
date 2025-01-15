import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class MeteringPoint extends $interface.MeteringPoint {
  final $native.MeteringPoint obj;

  MeteringPoint.$native(
    this.obj, {
    required super.size,
  }) : super.impl();
}

extension MeteringPointObj on $native.MeteringPoint {
  MeteringPoint get args {
    return MeteringPoint.$native(
      this,
      size: size,
    );
  }
}