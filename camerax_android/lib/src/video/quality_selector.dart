// import 'package:camerax_android/src/jni.dart' as jni;
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';
// import 'package:jni/jni.dart';

// import 'fallback_strategy.dart';

// class MyQualitySelector implements QualitySelector {
//   final jni.QualitySelector jniValue;

//   MyQualitySelector.jni(this.jniValue);

//   factory MyQualitySelector.from(
//     Quality quality, {
//     FallbackStrategy? fallbackStrategy,
//   }) {
//     if (fallbackStrategy == null) {
//       final jSelector = jni.QualitySelector.from(quality.jniValue);
//       return MyQualitySelector.jni(jSelector);
//     }
//     if (fallbackStrategy is! MyFallbackStrategy) {
//       throw TypeError();
//     }
//     final jSelector =
//         jni.QualitySelector.from1(quality.jniValue, fallbackStrategy.jniValue);
//     return MyQualitySelector.jni(jSelector);
//   }

//   factory MyQualitySelector.fromOrderedList(
//     List<Quality> qualities, {
//     FallbackStrategy? fallbackStrategy,
//   }) {
//     if (fallbackStrategy == null) {
//       final jQualities = qualities
//           .map((quality) => quality.jniValue)
//           .toJList(jni.Quality.type);
//       final jSelector = jni.QualitySelector.fromOrderedList(jQualities);
//       return MyQualitySelector.jni(jSelector);
//     }
//     if (fallbackStrategy is! MyFallbackStrategy) {
//       throw TypeError();
//     }
//     final jQualities =
//         qualities.map((quality) => quality.jniValue).toJList(jni.Quality.type);
//     final jSelector = jni.QualitySelector.fromOrderedList1(
//         jQualities, fallbackStrategy.jniValue);
//     return MyQualitySelector.jni(jSelector);
//   }
// }
