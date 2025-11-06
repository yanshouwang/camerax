import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'aspect_ratio_strategy_impl.dart';
import 'resolution_filter_impl.dart';
import 'resolution_strategy_impl.dart';

final class ResolutionSelectorImpl extends ResolutionSelector {
  final ResolutionSelectorProxyApi api;

  ResolutionSelectorImpl.internal(this.api) : super.impl();

  factory ResolutionSelectorImpl({
    ResolutionSelectorMode? mode,
    AspectRatioStrategy? aspectRatioStrategy,
    ResolutionFilter? resolutionFilter,
    ResolutionStrategy? resolutionStrategy,
  }) {
    final api = ResolutionSelectorProxyApi.build(
      mode: mode?.api,
      aspectRatioStrategy: aspectRatioStrategy?.api,
      resolutionFilter: resolutionFilter?.api,
      resolutionStrategy: resolutionStrategy?.api,
    );
    return ResolutionSelectorImpl.internal(api);
  }

  @override
  Future<ResolutionSelectorMode> getAllowedResolutionMode() =>
      api.getAllowedResolutionMode().then((e) => e.impl);

  @override
  Future<AspectRatioStrategy> getAspectRatioStrategy() =>
      api.getAspectRatioStrategy().then((e) => e.impl);

  @override
  Future<ResolutionFilter?> getResolutionFilter() =>
      api.getResolutionFilter().then((e) => e?.impl);

  @override
  Future<ResolutionStrategy?> getResolutionStrategy() =>
      api.getResolutionStrategy().then((e) => e?.impl);
}

extension ResolutionSelectorModeX on ResolutionSelectorMode {
  ResolutionSelectorModeApi get api => ResolutionSelectorModeApi.values[index];
}

extension ResolutionSelectorModeApiX on ResolutionSelectorModeApi {
  ResolutionSelectorMode get impl => ResolutionSelectorMode.values[index];
}

extension ResolutionSelectorX on ResolutionSelector {
  ResolutionSelectorProxyApi get api {
    final impl = this;
    if (impl is! ResolutionSelectorImpl) throw TypeError();
    return impl.api;
  }
}

extension ResolutionSelectorProxyApiX on ResolutionSelectorProxyApi {
  ResolutionSelector get impl => ResolutionSelectorImpl.internal(this);
}
