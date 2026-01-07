import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum ResolutionSelector$Mode {
  preferCaptureRateOverHigherResolution,
  preferHigherResolutionOverCaptureRate,
}

abstract interface class ResolutionSelector$Builder {
  factory ResolutionSelector$Builder() =>
      ResolutionSelectorChannel.instance.createBuilder();

  Future<ResolutionSelector$Builder> setAllowedResolutionMode(
    ResolutionSelector$Mode mode,
  );
  Future<ResolutionSelector$Builder> setAspectRatioStrategy(
    AspectRatioStrategy aspectRatioStrategy,
  );
  Future<ResolutionSelector$Builder> setResolutionFilter(
    ResolutionFilter resolutionFilter,
  );
  Future<ResolutionSelector$Builder> setResolutionStrategy(
    ResolutionStrategy resolutionStrategy,
  );
  Future<ResolutionSelector> build();
}

abstract interface class ResolutionSelector {
  Future<ResolutionSelector$Mode> getAllowedResolutionMode();
  Future<AspectRatioStrategy> getAspectRatioStrategy();
  Future<ResolutionFilter?> getResolutionFilter();
  Future<ResolutionStrategy?> getResolutionStrategy();
}

abstract base class ResolutionSelectorChannel extends PlatformInterface {
  ResolutionSelectorChannel() : super(token: _token);

  static final _token = Object();

  static ResolutionSelectorChannel? _instance;

  static ResolutionSelectorChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(ResolutionSelectorChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  ResolutionSelector$Builder createBuilder();
}
