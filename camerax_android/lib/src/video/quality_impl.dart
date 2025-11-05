import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class QualityImpl extends QualityApi {
  static QualityApi get sd => QualityImpl.internal(QualityProxyApi.sd);
  static QualityApi get hd => QualityImpl.internal(QualityProxyApi.hd);
  static QualityApi get fhd => QualityImpl.internal(QualityProxyApi.fhd);
  static QualityApi get uhd => QualityImpl.internal(QualityProxyApi.uhd);
  static QualityApi get lowest => QualityImpl.internal(QualityProxyApi.lowest);
  static QualityApi get highest =>
      QualityImpl.internal(QualityProxyApi.highest);

  final QualityProxyApi api;

  QualityImpl.internal(this.api) : super.impl();
}

extension QualityApiX on QualityApi {
  QualityProxyApi get api {
    final impl = this;
    if (impl is! QualityImpl) throw TypeError();
    return impl.api;
  }
}

extension QualityProxyApiX on QualityProxyApi {
  QualityApi get impl => QualityImpl.internal(this);
}
