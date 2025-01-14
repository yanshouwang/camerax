import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

final class FallbackStrategy {
  final $base.FallbackStrategy _obj;

  FallbackStrategy.higherQualityOrLowerThan($base.Quality quality)
      : _obj = $base.FallbackStrategy.higherQualityOrLowerThan(quality);

  FallbackStrategy.higherQualityThan($base.Quality quality)
      : _obj = $base.FallbackStrategy.higherQualityThan(quality);

  FallbackStrategy.lowerQualityOrHigherThan($base.Quality quality)
      : _obj = $base.FallbackStrategy.lowerQualityOrHigherThan(quality);

  FallbackStrategy.lowerQualityThan($base.Quality quality)
      : _obj = $base.FallbackStrategy.lowerQualityThan(quality);

  @internal
  $base.FallbackStrategy get obj => _obj;
}
