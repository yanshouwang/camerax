// import 'package:camerax_ios/src/camerax.g.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// import 'quality_impl.dart';

// final class FallbackStrategyImpl extends FallbackStrategyChannel {
//   final FallbackStrategyApi api;

//   FallbackStrategyImpl.internal(this.api) : super.impl();

//   factory FallbackStrategyImpl.higherQualityOrLowerThan(Quality quality) {
//     final api = FallbackStrategyApi.higherQualityOrLowerThan(
//       quality: quality.api,
//     );
//     return FallbackStrategyImpl.internal(api);
//   }

//   factory FallbackStrategyImpl.higherQualityThan(Quality quality) {
//     final api = FallbackStrategyApi.higherQualityThan(
//       quality: quality.api,
//     );
//     return FallbackStrategyImpl.internal(api);
//   }

//   factory FallbackStrategyImpl.lowerQualityOrHigherThan(Quality quality) {
//     final api = FallbackStrategyApi.lowerQualityOrHigherThan(
//       quality: quality.api,
//     );
//     return FallbackStrategyImpl.internal(api);
//   }

//   factory FallbackStrategyImpl.lowerQualityThan(Quality quality) {
//     final api = FallbackStrategyApi.lowerQualityThan(
//       quality: quality.api,
//     );
//     return FallbackStrategyImpl.internal(api);
//   }
// }
