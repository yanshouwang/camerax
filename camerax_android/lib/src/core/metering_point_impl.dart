import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MeteringPointImpl extends MeteringPointApi {
  final MeteringPointApi api;

  MeteringPointImpl.internal(this.api) : super.impl(size: api.size);
}

extension MeteringPointX on MeteringPointApi {
  MeteringPointApi get api {
    final impl = this;
    if (impl is! MeteringPointImpl) throw TypeError();
    return impl.api;
  }
}

extension MeteringPointApiX on MeteringPointApi {
  MeteringPointImpl get impl => MeteringPointImpl.internal(this);
}
