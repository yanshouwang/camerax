// import 'package:camerax_ios/src/camerax_api.g.dart';
// import 'package:camerax_ios/src/common.dart';
// import 'package:camerax_ios/src/core.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// import 'fallback_strategy_impl.dart';
// import 'quality_impl.dart';

// final class QualitySelectorImpl extends QualitySelector {
//   static Future<Size<int>?> getResolution(
//     CameraInfo cameraInfo,
//     Quality quality,
//   ) => QualitySelectorApi.getResolution(
//     cameraInfo.api,
//     quality.api,
//   ).then((e) => e?.impl);

//   final QualitySelectorApi api;

//   QualitySelectorImpl.internal(this.api) : super.impl();

//   factory QualitySelectorImpl.from(
//     Quality quality, {
//     FallbackStrategy? fallbackStrategy,
//   }) {
//     final api = QualitySelectorApi.from(
//       quality: quality.api,
//       fallbackStrategy: fallbackStrategy?.api,
//     );
//     return QualitySelectorImpl.internal(api);
//   }

//   factory QualitySelectorImpl.fromOrderedList(
//     List<Quality> qualities, {
//     FallbackStrategy? fallbackStrategy,
//   }) {
//     final api = QualitySelectorApi.fromOrderedList(
//       qualities: qualities.map((e) => e.api).toList(),
//       fallbackStrategy: fallbackStrategy?.api,
//     );
//     return QualitySelectorImpl.internal(api);
//   }
// }

// extension QualitySelectorX on QualitySelector {
//   QualitySelectorApi get api {
//     final impl = this;
//     if (impl is! QualitySelectorImpl) throw TypeError();
//     return impl.api;
//   }
// }

// extension QualitySelectorApiX on QualitySelectorApi {
//   QualitySelector get impl => QualitySelectorImpl.internal(this);
// }
