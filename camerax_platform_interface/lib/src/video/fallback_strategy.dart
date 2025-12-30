import 'package:camerax_platform_interface/src/video.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class FallbackStrategy {
  factory FallbackStrategy.higherQualityOrLowerThan(Quality quality) =>
      FallbackStrategyChannel.instance.higherQualityOrLowerThan(quality);

  factory FallbackStrategy.higherQualityThan(Quality quality) =>
      FallbackStrategyChannel.instance.higherQualityThan(quality);

  factory FallbackStrategy.lowerQualityOrHigherThan(Quality quality) =>
      FallbackStrategyChannel.instance.lowerQualityOrHigherThan(quality);

  factory FallbackStrategy.lowerQualityThan(Quality quality) =>
      FallbackStrategyChannel.instance.lowerQualityThan(quality);
}

abstract base class FallbackStrategyChannel extends PlatformInterface {
  FallbackStrategyChannel() : super(token: _token);

  static final _token = Object();

  static FallbackStrategyChannel? _instance;

  static FallbackStrategyChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(FallbackStrategyChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  FallbackStrategy higherQualityOrLowerThan(Quality quality);
  FallbackStrategy higherQualityThan(Quality quality);
  FallbackStrategy lowerQualityOrHigherThan(Quality quality);
  FallbackStrategy lowerQualityThan(Quality quality);
}
