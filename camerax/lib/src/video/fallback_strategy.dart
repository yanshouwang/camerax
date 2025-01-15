import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

final class FallbackStrategy {
  final $interface.FallbackStrategy _obj;

  FallbackStrategy.higherQualityOrLowerThan($interface.Quality quality)
      : _obj = $interface.FallbackStrategy.higherQualityOrLowerThan(quality);

  FallbackStrategy.higherQualityThan($interface.Quality quality)
      : _obj = $interface.FallbackStrategy.higherQualityThan(quality);

  FallbackStrategy.lowerQualityOrHigherThan($interface.Quality quality)
      : _obj = $interface.FallbackStrategy.lowerQualityOrHigherThan(quality);

  FallbackStrategy.lowerQualityThan($interface.Quality quality)
      : _obj = $interface.FallbackStrategy.lowerQualityThan(quality);

  @internal
  $interface.FallbackStrategy get obj => _obj;
}
