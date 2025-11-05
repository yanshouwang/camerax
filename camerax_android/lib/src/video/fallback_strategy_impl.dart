import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'quality_impl.dart';

final class FallbackStrategyImpl extends FallbackStrategyApi {
  final FallbackStrategyProxyApi api;

  FallbackStrategyImpl.internal(this.api) : super.impl();

  factory FallbackStrategyImpl.higherQualityOrLowerThan(QualityApi quality) {
    final api = FallbackStrategyProxyApi.higherQualityOrLowerThan(
      quality: quality.api,
    );
    return FallbackStrategyImpl.internal(api);
  }

  factory FallbackStrategyImpl.higherQualityThan(QualityApi quality) {
    final api = FallbackStrategyProxyApi.higherQualityThan(
      quality: quality.api,
    );
    return FallbackStrategyImpl.internal(api);
  }

  factory FallbackStrategyImpl.lowerQualityOrHigherThan(QualityApi quality) {
    final api = FallbackStrategyProxyApi.lowerQualityOrHigherThan(
      quality: quality.api,
    );
    return FallbackStrategyImpl.internal(api);
  }

  factory FallbackStrategyImpl.lowerQualityThan(QualityApi quality) {
    final api = FallbackStrategyProxyApi.lowerQualityThan(quality: quality.api);
    return FallbackStrategyImpl.internal(api);
  }
}

extension FallbackStrategyApiX on FallbackStrategyApi {
  FallbackStrategyProxyApi get api {
    final impl = this;
    if (impl is! FallbackStrategyImpl) throw TypeError();
    return impl.api;
  }
}
