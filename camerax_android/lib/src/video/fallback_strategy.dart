import 'package:camerax_android/src/jni.dart' as jni;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class MyFallbackStrategy implements FallbackStrategy {
  final jni.FallbackStrategy jniValue;

  MyFallbackStrategy.jni(this.jniValue);

  factory MyFallbackStrategy.higherQualityOrLowerThan(Quality quality) {
    final strategy =
        jni.FallbackStrategy.higherQualityOrLowerThan(quality.jniValue);
    return MyFallbackStrategy.jni(strategy);
  }

  factory MyFallbackStrategy.higherQualityThan(Quality quality) {
    final strategy = jni.FallbackStrategy.higherQualityThan(quality.jniValue);
    return MyFallbackStrategy.jni(strategy);
  }

  factory MyFallbackStrategy.lowerQualityOrHigherThan(Quality quality) {
    final strategy =
        jni.FallbackStrategy.lowerQualityOrHigherThan(quality.jniValue);
    return MyFallbackStrategy.jni(strategy);
  }

  factory MyFallbackStrategy.lowerQualityThan(Quality quality) {
    final strategy = jni.FallbackStrategy.lowerQualityThan(quality.jniValue);
    return MyFallbackStrategy.jni(strategy);
  }
}
