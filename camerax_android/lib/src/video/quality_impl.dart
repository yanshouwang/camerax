import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class QualityImpl extends Quality {
  static QualityImpl get sd => QualityImpl.internal(QualityProxyApi.sd);
  static QualityImpl get hd => QualityImpl.internal(QualityProxyApi.hd);
  static QualityImpl get fhd => QualityImpl.internal(QualityProxyApi.fhd);
  static QualityImpl get uhd => QualityImpl.internal(QualityProxyApi.uhd);
  static QualityImpl get lowest => QualityImpl.internal(QualityProxyApi.lowest);
  static QualityImpl get highest => QualityImpl.internal(QualityProxyApi.highest);

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
