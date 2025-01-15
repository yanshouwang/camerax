import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

final class MeteringPoint {
  final $interface.MeteringPoint _obj;

  MeteringPoint._native(this._obj);

  @internal
  $interface.MeteringPoint get obj => _obj;

  double get size => _obj.size;
}

extension MeteringPointObj on $interface.MeteringPoint {
  @internal
  MeteringPoint get args {
    return MeteringPoint._native(this);
  }
}
