import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'quality.dart';

final class FallbackStrategy extends $base.FallbackStrategy {
  final $native.FallbackStrategy obj;

  FallbackStrategy.$native(this.obj) : super.impl();

  factory FallbackStrategy.higherQualityOrLowerThan($base.Quality quality) {
    final obj = $native.FallbackStrategy.higherQualityOrLowerThan(
      quality: quality.obj,
    );
    return FallbackStrategy.$native(obj);
  }

  factory FallbackStrategy.higherQualityThan($base.Quality quality) {
    final obj = $native.FallbackStrategy.higherQualityThan(
      quality: quality.obj,
    );
    return FallbackStrategy.$native(obj);
  }

  factory FallbackStrategy.lowerQualityOrHigherThan($base.Quality quality) {
    final obj = $native.FallbackStrategy.lowerQualityOrHigherThan(
      quality: quality.obj,
    );
    return FallbackStrategy.$native(obj);
  }

  factory FallbackStrategy.lowerQualityThan($base.Quality quality) {
    final obj = $native.FallbackStrategy.lowerQualityThan(
      quality: quality.obj,
    );
    return FallbackStrategy.$native(obj);
  }
}
