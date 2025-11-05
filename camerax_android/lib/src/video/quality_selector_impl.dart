import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'fallback_strategy_impl.dart';
import 'quality_impl.dart';

final class QualitySelectorImpl extends QualitySelectorApi {
  static Future<SizeApi?> getResolution(
    CameraInfoApi cameraInfo,
    QualityApi quality,
  ) => QualitySelectorProxyApi.getResolution(
    cameraInfo.api,
    quality.api,
  ).then((e) => e?.impl);

  final QualitySelectorProxyApi api;

  QualitySelectorImpl.internal(this.api) : super.impl();

  factory QualitySelectorImpl.from(
    QualityApi quality, {
    FallbackStrategyApi? fallbackStrategy,
  }) {
    final api = QualitySelectorProxyApi.from(
      quality: quality.api,
      fallbackStrategy: fallbackStrategy?.api,
    );
    return QualitySelectorImpl.internal(api);
  }

  factory QualitySelectorImpl.fromOrderedList(
    List<QualityApi> qualities, {
    FallbackStrategyApi? fallbackStrategy,
  }) {
    final api = QualitySelectorProxyApi.fromOrderedList(
      qualities: qualities.map((e) => e.api).toList(),
      fallbackStrategy: fallbackStrategy?.api,
    );
    return QualitySelectorImpl.internal(api);
  }
}

extension QualitySelectorApiX on QualitySelectorApi {
  QualitySelectorProxyApi get api {
    final impl = this;
    if (impl is! QualitySelectorImpl) throw TypeError();
    return impl.api;
  }
}

extension QualitySelectorProxyApiX on QualitySelectorProxyApi {
  QualitySelectorApi get impl => QualitySelectorImpl.internal(this);
}
