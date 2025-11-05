import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MeteringPointImpl extends MeteringPoint {
  final MeteringPointProxyApi api;

  MeteringPointImpl.internal(this.api) : super.impl();

  @override
  double get size => api.size;
}

extension MeteringPointApiX on MeteringPoint {
  MeteringPointProxyApi get api {
    final impl = this;
    if (impl is! MeteringPointImpl) throw TypeError();
    return impl.api;
  }
}

extension MeteringPointProxyApiX on MeteringPointProxyApi {
  MeteringPoint get impl => MeteringPointImpl.internal(this);
}
