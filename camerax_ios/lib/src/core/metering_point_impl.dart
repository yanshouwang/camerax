import 'package:camerax_ios/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MeteringPointImpl implements MeteringPoint {
  final MeteringPointProxyApi api;

  MeteringPointImpl.internal(this.api);

  @override
  double get size => api.size;
}

extension MeteringPointX on MeteringPoint {
  MeteringPointProxyApi get api {
    final impl = this;
    if (impl is! MeteringPointImpl) throw TypeError();
    return impl.api;
  }
}

extension MeteringPointProxyApiX on MeteringPointProxyApi {
  MeteringPoint get impl => MeteringPointImpl.internal(this);
}
