// import 'package:camerax_ios/src/camerax.g.dart';
// import 'package:camerax_ios/src/common.dart';
// import 'package:camerax_ios/src/core.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// import 'fallback_strategy_impl.dart';
// import 'quality_impl.dart';

// final class QualitySelectorImpl extends QualitySelectorChannel {
//   final QualitySelectorApi api;

//   QualitySelectorImpl.impl(this.api) : super.impl();

//   factory QualitySelectorImpl.from(
//     Quality quality, {
//     FallbackStrategy? fallbackStrategy,
//   }) {
//     if (fallbackStrategy is! FallbackStrategyImpl?) {
//       throw TypeError();
//     }
//     final api = QualitySelectorApi.from(
//       quality: quality.api,
//       fallbackStrategy: fallbackStrategy?.api,
//     );
//     return QualitySelectorImpl.impl(api);
//   }

//   factory QualitySelectorImpl.fromOrderedList(
//     List<Quality> qualities, {
//     FallbackStrategy? fallbackStrategy,
//   }) {
//     if (fallbackStrategy is! FallbackStrategyImpl?) {
//       throw TypeError();
//     }
//     final api = QualitySelectorApi.fromOrderedList(
//       qualities: qualities.map((e) => e.api).toList(),
//       fallbackStrategy: fallbackStrategy?.api,
//     );
//     return QualitySelectorImpl.impl(api);
//   }

//   static Future<Size?> getResolution(CameraInfo cameraInfo, Quality quality) {
//     if (cameraInfo is! CameraInfoImpl) {
//       throw TypeError();
//     }
//     return QualitySelectorApi.getResolution(cameraInfo.api, quality.api)
//         .then((e) => e?.impl);
//   }
// }

// extension QualitySelectorApiX on QualitySelectorApi {
//   QualitySelector get impl => QualitySelectorImpl.impl(this);
// }
