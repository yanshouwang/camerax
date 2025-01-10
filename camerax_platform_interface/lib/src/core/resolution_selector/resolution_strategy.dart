import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract base class ResolutionStrategy extends PlatformInterface {
  static final _token = Object();

  ResolutionStrategy.impl() : super(token: _token);

  factory ResolutionStrategy({
    required Size boundSize,
    required ResolutionFallbackRule fallbackRule,
  }) =>
      CameraX.instance.createResolutionStrategy(
        boundSize: boundSize,
        fallbackRule: fallbackRule,
      );

  Future<Size?> getBoundSize();
  Future<ResolutionFallbackRule> getFallbackRule();

  static ResolutionStrategy get highestAvailableStrategy =>
      CameraX.instance.getHighestAvailableStrategy();
}
