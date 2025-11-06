import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class QualityImpl extends Quality {
  static Quality get sd => QualityImpl.internal(QualityProxyApi.sd);
  static Quality get hd => QualityImpl.internal(QualityProxyApi.hd);
  static Quality get fhd => QualityImpl.internal(QualityProxyApi.fhd);
  static Quality get uhd => QualityImpl.internal(QualityProxyApi.uhd);
  static Quality get lowest => QualityImpl.internal(QualityProxyApi.lowest);
  static Quality get highest => QualityImpl.internal(QualityProxyApi.highest);

  final QualityProxyApi api;

  QualityImpl.internal(this.api) : super.impl();
}

extension QualityX on Quality {
  QualityProxyApi get api {
    final impl = this;
    if (impl is! QualityImpl) throw TypeError();
    return impl.api;
  }
}

extension QualityProxyApiX on QualityProxyApi {
  Quality get impl => QualityImpl.internal(this);
}
