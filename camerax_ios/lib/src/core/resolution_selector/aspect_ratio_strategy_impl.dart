// import 'package:camerax_ios/src/api.dart';
// import 'package:camerax_ios/src/core/aspect_ratio_impl.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// final class AspectRatioStrategyImpl implements AspectRatioStrategy {
//   final AspectRatioStrategyProxyApi api;

//   AspectRatioStrategyImpl.internal(this.api);

//   @override
//   Future<AspectRatioStrategy$FallbackRule> getFallbackRule() =>
//       api.getFallbackRule().then((e) => e.impl);

//   @override
//   Future<AspectRatio> getPreferredAspectRatio() =>
//       api.getPreferredAspectRatio().then((e) => e.impl);
// }

// final class AspectRatioStrategyChannelImpl extends AspectRatioStrategyChannel {
//   @override
//   AspectRatioStrategy get ratio4_3FallbackAutoStrategy =>
//       AspectRatioStrategyImpl.internal(
//         AspectRatioStrategyProxyApi.ratio4_3FallbackAutoStrategy,
//       );
//   @override
//   AspectRatioStrategy get ratio16_9FallbackAutoStrategy =>
//       AspectRatioStrategyImpl.internal(
//         AspectRatioStrategyProxyApi.ratio16_9FallbackAutoStrategy,
//       );

//   @override
//   AspectRatioStrategy create({
//     required AspectRatio preferredAspectRatio,
//     required AspectRatioStrategy$FallbackRule fallbackRule,
//   }) {
//     final api = AspectRatioStrategyProxyApi(
//       preferredAspectRatio: preferredAspectRatio.api,
//       fallbackRule: fallbackRule.api,
//     );
//     return AspectRatioStrategyImpl.internal(api);
//   }
// }

// extension AspectRatioStrategy$FallbackRuleX
//     on AspectRatioStrategy$FallbackRule {
//   AspectRatioStrategyFallbackRuleApi get api =>
//       AspectRatioStrategyFallbackRuleApi.values[index];
// }

// extension AspectRatioStrategyFallbackRuleApiX
//     on AspectRatioStrategyFallbackRuleApi {
//   AspectRatioStrategy$FallbackRule get impl =>
//       AspectRatioStrategy$FallbackRule.values[index];
// }

// extension AspectRatioStrategyX on AspectRatioStrategy {
//   AspectRatioStrategyProxyApi get api {
//     final impl = this;
//     if (impl is! AspectRatioStrategyImpl) throw TypeError();
//     return impl.api;
//   }
// }

// extension AspectRatioStrategyProxyApiX on AspectRatioStrategyProxyApi {
//   AspectRatioStrategy get impl => AspectRatioStrategyImpl.internal(this);
// }
