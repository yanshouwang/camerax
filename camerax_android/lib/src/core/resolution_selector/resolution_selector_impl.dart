import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'aspect_ratio_strategy_impl.dart';
import 'resolution_filter_impl.dart';
import 'resolution_strategy_impl.dart';

final class ResolutionSelectorImpl extends ResolutionSelectorApi {
  final ResolutionSelectorProxyApi api;

  ResolutionSelectorImpl.internal(this.api) : super.impl();

  factory ResolutionSelectorImpl({
    ResolutionSelectorMode? mode,
    AspectRatioStrategyApi? aspectRatioStrategy,
    ResolutionFilterApi? resolutionFilter,
    ResolutionStrategyApi? resolutionStrategy,
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
  Future<AspectRatioStrategyApi> getAspectRatioStrategy() =>
      api.getAspectRatioStrategy().then((e) => e.impl);

  @override
  Future<ResolutionFilterApi?> getResolutionFilter() =>
      api.getResolutionFilter().then((e) => e?.impl);

  @override
  Future<ResolutionStrategyApi?> getResolutionStrategy() =>
      api.getResolutionStrategy().then((e) => e?.impl);
}

extension ResolutionSelectorModeX on ResolutionSelectorMode {
  ResolutionSelectorModeApi get api => ResolutionSelectorModeApi.values[index];
}

extension ResolutionSelectorModeApiX on ResolutionSelectorModeApi {
  ResolutionSelectorMode get impl => ResolutionSelectorMode.values[index];
}

extension ResolutionSelectorApiX on ResolutionSelectorApi {
  ResolutionSelectorProxyApi get api {
    final impl = this;
    if (impl is! ResolutionSelectorImpl) throw TypeError();
    return impl.api;
  }
}

extension ResolutionSelectorProxyApiX on ResolutionSelectorProxyApi {
  ResolutionSelectorApi get impl => ResolutionSelectorImpl.internal(this);
}
