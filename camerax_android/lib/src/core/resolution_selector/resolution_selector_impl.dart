import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'aspect_ratio_strategy_impl.dart';
import 'resolution_filter_impl.dart';
import 'resolution_strategy_impl.dart';

final class ResolutionSelectorImpl implements ResolutionSelector {
  final ResolutionSelectorProxyApi api;

  ResolutionSelectorImpl.internal(this.api);

  @override
  Future<ResolutionSelector$Mode> getAllowedResolutionMode() =>
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

final class ResolutionSelectorChannelImpl extends ResolutionSelectorChannel {
  @override
  ResolutionSelector create({
    ResolutionSelector$Mode? mode,
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
}

extension ResolutionSelector$ModeX on ResolutionSelector$Mode {
  ResolutionSelectorModeApi get api => ResolutionSelectorModeApi.values[index];
}

extension ResolutionSelectorModeApiX on ResolutionSelectorModeApi {
  ResolutionSelector$Mode get impl => ResolutionSelector$Mode.values[index];
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
