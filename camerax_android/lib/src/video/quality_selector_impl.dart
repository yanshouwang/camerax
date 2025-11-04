import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'fallback_strategy_impl.dart';
import 'quality_impl.dart';

final class QualitySelectorImpl extends QualitySelectorApi {
  static Future<SizeApi<int>?> getResolution(
    CameraInfoApi cameraInfo,
    Quality quality,
  ) => QualitySelectorApi.getResolution(
    cameraInfo.api,
    quality.api,
  ).then((e) => e?.impl);

  final QualitySelectorApi api;

  QualitySelectorImpl.internal(this.api) : super.impl();

  factory QualitySelectorImpl.from(
    Quality quality, {
    FallbackStrategyApi? fallbackStrategy,
  }) {
    final api = QualitySelectorApi.from(
      quality: quality.api,
      fallbackStrategy: fallbackStrategy?.api,
    );
    return QualitySelectorImpl.internal(api);
  }

  factory QualitySelectorImpl.fromOrderedList(
    List<Quality> qualities, {
    FallbackStrategyApi? fallbackStrategy,
  }) {
    final api = QualitySelectorApi.fromOrderedList(
      qualities: qualities.map((e) => e.api).toList(),
      fallbackStrategy: fallbackStrategy?.api,
    );
    return QualitySelectorImpl.internal(api);
  }
}

extension QualitySelectorX on QualitySelectorApi {
  QualitySelectorApi get api {
    final impl = this;
    if (impl is! QualitySelectorImpl) throw TypeError();
    return impl.api;
  }
}

extension QualitySelectorApiX on QualitySelectorApi {
  QualitySelectorApi get impl => QualitySelectorImpl.internal(this);
}
