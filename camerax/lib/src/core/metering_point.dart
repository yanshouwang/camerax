import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

final class MeteringPoint {
  final $base.MeteringPoint _obj;

  MeteringPoint._native(this._obj);

  @internal
  $base.MeteringPoint get obj => _obj;

  double get size => _obj.size;
}

extension MeteringPointObj on $base.MeteringPoint {
  @internal
  MeteringPoint get args {
    return MeteringPoint._native(this);
  }
}
