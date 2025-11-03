// import 'package:camerax_ios/src/camerax_api.g.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// extension QualityX on Quality {
//   QualityApi get api {
//     switch (this) {
//       case Quality.fhd:
//         return QualityApi.fhd;
//       case Quality.hd:
//         return QualityApi.hd;
//       case Quality.highest:
//         return QualityApi.highest;
//       case Quality.lowest:
//         return QualityApi.lowest;
//       case Quality.sd:
//         return QualityApi.sd;
//       case Quality.uhd:
//         return QualityApi.uhd;
//     }
//   }
// }

// extension QualityApiX on QualityApi {
//   Quality get impl {
//     if (this == QualityApi.fhd) {
//       return Quality.fhd;
//     }
//     if (this == QualityApi.hd) {
//       return Quality.hd;
//     }
//     if (this == QualityApi.highest) {
//       return Quality.highest;
//     }
//     if (this == QualityApi.lowest) {
//       return Quality.lowest;
//     }
//     if (this == QualityApi.sd) {
//       return Quality.sd;
//     }
//     if (this == QualityApi.uhd) {
//       return Quality.uhd;
//     }
//     throw ArgumentError.value(this);
//   }
// }
