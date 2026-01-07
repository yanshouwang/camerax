// import 'package:camerax_ios/src/api.dart';
// import 'package:camerax_ios/src/video.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// final class FallbackStrategyImpl implements FallbackStrategy {
//   final FallbackStrategyProxyApi api;

//   FallbackStrategyImpl.internal(this.api);
// }

// final class FallbackStrategyChannelImpl extends FallbackStrategyChannel {
//   @override
//   FallbackStrategy higherQualityOrLowerThan(Quality quality) {
//     final api = FallbackStrategyProxyApi.higherQualityOrLowerThan(
//       quality: quality.api,
//     );
//     return FallbackStrategyImpl.internal(api);
//   }

//   @override
//   FallbackStrategy higherQualityThan(Quality quality) {
//     final api = FallbackStrategyProxyApi.higherQualityThan(
//       quality: quality.api,
//     );
//     return FallbackStrategyImpl.internal(api);
//   }

//   @override
//   FallbackStrategy lowerQualityOrHigherThan(Quality quality) {
//     final api = FallbackStrategyProxyApi.lowerQualityOrHigherThan(
//       quality: quality.api,
//     );
//     return FallbackStrategyImpl.internal(api);
//   }

//   @override
//   FallbackStrategy lowerQualityThan(Quality quality) {
//     final api = FallbackStrategyProxyApi.lowerQualityThan(quality: quality.api);
//     return FallbackStrategyImpl.internal(api);
//   }
// }

// extension FallbackStrategyX on FallbackStrategy {
//   FallbackStrategyProxyApi get api {
//     final impl = this;
//     if (impl is! FallbackStrategyImpl) throw TypeError();
//     return impl.api;
//   }
// }
