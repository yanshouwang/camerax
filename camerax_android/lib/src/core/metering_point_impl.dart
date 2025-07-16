import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MeteringPointImpl extends MeteringPoint {
  final MeteringPointApi api;

  MeteringPointImpl.internal(
    this.api, {
    required super.size,
  }) : super.impl();
}

extension MeteringPointApiX on MeteringPointApi {
  MeteringPointImpl get impl {
    return MeteringPointImpl.internal(
      this,
      size: size,
    );
  }
}
