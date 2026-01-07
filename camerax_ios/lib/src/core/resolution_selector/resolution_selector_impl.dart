import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ResolutionSelector$BuilderImpl
    implements ResolutionSelector$Builder {
  final ResolutionSelectorBuilderProxyApi api;

  ResolutionSelector$BuilderImpl.internal(this.api);

  @override
  Future<ResolutionSelector$Builder> setAllowedResolutionMode(
    ResolutionSelector$Mode mode,
  ) => throw UnimplementedError();

  @override
  Future<ResolutionSelector$Builder> setAspectRatioStrategy(
    AspectRatioStrategy aspectRatioStrategy,
  ) => throw UnimplementedError();

  @override
  Future<ResolutionSelector$Builder> setResolutionFilter(
    ResolutionFilter resolutionFilter,
  ) => throw UnimplementedError();

  @override
  Future<ResolutionSelector$Builder> setResolutionStrategy(
    ResolutionStrategy resolutionStrategy,
  ) => api.setResolutionStrategy(resolutionStrategy.api).then((e) => e.impl);

  @override
  Future<ResolutionSelector> build() => api.build().then((e) => e.impl);
}

final class ResolutionSelectorImpl implements ResolutionSelector {
  final ResolutionSelectorProxyApi api;

  ResolutionSelectorImpl.internal(this.api);

  @override
  Future<ResolutionSelector$Mode> getAllowedResolutionMode() =>
      throw UnimplementedError();

  @override
  Future<AspectRatioStrategy> getAspectRatioStrategy() =>
      throw UnimplementedError();

  @override
  Future<ResolutionFilter?> getResolutionFilter() => throw UnimplementedError();

  @override
  Future<ResolutionStrategy?> getResolutionStrategy() =>
      api.getResolutionStrategy().then((e) => e?.impl);
}

final class ResolutionSelectorChannelImpl extends ResolutionSelectorChannel {
  @override
  ResolutionSelector$Builder createBuilder() {
    final api = ResolutionSelectorBuilderProxyApi();
    return ResolutionSelector$BuilderImpl.internal(api);
  }
}

extension ResolutionSelector$ModeX on ResolutionSelector$Mode {
  ResolutionSelectorModeApi get api => ResolutionSelectorModeApi.values[index];
}

extension ResolutionSelectorModeApiX on ResolutionSelectorModeApi {
  ResolutionSelector$Mode get impl => ResolutionSelector$Mode.values[index];
}

extension ResolutionSelectorBuilderProxyApiX
    on ResolutionSelectorBuilderProxyApi {
  ResolutionSelector$Builder get impl =>
      ResolutionSelector$BuilderImpl.internal(this);
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
