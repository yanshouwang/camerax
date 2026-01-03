// import 'package:camerax_ios/src/api.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// final class QualityImpl implements Quality {
//   final QualityProxyApi api;

//   QualityImpl.internal(this.api);
// }

// final class QualityChannelImpl extends QualityChannel {
//   @override
//   Quality get sd => QualityImpl.internal(QualityProxyApi.sd);
//   @override
//   Quality get hd => QualityImpl.internal(QualityProxyApi.hd);
//   @override
//   Quality get fhd => QualityImpl.internal(QualityProxyApi.fhd);
//   @override
//   Quality get uhd => QualityImpl.internal(QualityProxyApi.uhd);
//   @override
//   Quality get lowest => QualityImpl.internal(QualityProxyApi.lowest);
//   @override
//   Quality get highest => QualityImpl.internal(QualityProxyApi.highest);
// }

// extension QualityX on Quality {
//   QualityProxyApi get api {
//     final impl = this;
//     if (impl is! QualityImpl) throw TypeError();
//     return impl.api;
//   }
// }

// extension QualityProxyApiX on QualityProxyApi {
//   Quality get impl => QualityImpl.internal(this);
// }
