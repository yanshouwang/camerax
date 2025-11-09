// import 'package:camerax_ios/src/camerax_api.g.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// import 'quality_impl.dart';

// final class FallbackStrategyImpl extends FallbackStrategy {
//   final FallbackStrategyProxyApi api;

//   FallbackStrategyImpl.internal(this.api) : super.impl();

//   factory FallbackStrategyImpl.higherQualityOrLowerThan(Quality quality) {
//     final api = FallbackStrategyProxyApi.higherQualityOrLowerThan(
//       quality: quality.api,
//     );
//     return FallbackStrategyImpl.internal(api);
//   }

//   factory FallbackStrategyImpl.higherQualityThan(Quality quality) {
//     final api = FallbackStrategyProxyApi.higherQualityThan(
//       quality: quality.api,
//     );
//     return FallbackStrategyImpl.internal(api);
//   }

//   factory FallbackStrategyImpl.lowerQualityOrHigherThan(Quality quality) {
//     final api = FallbackStrategyProxyApi.lowerQualityOrHigherThan(
//       quality: quality.api,
//     );
//     return FallbackStrategyImpl.internal(api);
//   }

//   factory FallbackStrategyImpl.lowerQualityThan(Quality quality) {
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
