import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_android/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class QualitySelectorImpl implements QualitySelector {
  final QualitySelectorProxyApi api;

  QualitySelectorImpl.internal(this.api);
}

final class QualitySelectorChannelImpl extends QualitySelectorChannel {
  @override
  Future<Size<int>?> getResolution(CameraInfo cameraInfo, Quality quality) =>
      QualitySelectorProxyApi.getResolution(
        cameraInfo.api,
        quality.api,
      ).then((e) => e?.impl);

  @override
  QualitySelector from(Quality quality, [FallbackStrategy? fallbackStrategy]) {
    final api = fallbackStrategy == null
        ? QualitySelectorProxyApi.from1(quality: quality.api)
        : QualitySelectorProxyApi.from2(
            quality: quality.api,
            fallbackStrategy: fallbackStrategy.api,
          );
    return QualitySelectorImpl.internal(api);
  }

  @override
  QualitySelector fromOrderedList(
    List<Quality> qualities, [
    FallbackStrategy? fallbackStrategy,
  ]) {
    final api = fallbackStrategy == null
        ? QualitySelectorProxyApi.fromOrderedList1(
            qualities: qualities.map((e) => e.api).toList(),
          )
        : QualitySelectorProxyApi.fromOrderedList2(
            qualities: qualities.map((e) => e.api).toList(),
            fallbackStrategy: fallbackStrategy.api,
          );
    return QualitySelectorImpl.internal(api);
  }
}

extension QualitySelectorX on QualitySelector {
  QualitySelectorProxyApi get api {
    final impl = this;
    if (impl is! QualitySelectorImpl) throw TypeError();
    return impl.api;
  }
}

extension QualitySelectorProxyApiX on QualitySelectorProxyApi {
  QualitySelector get impl => QualitySelectorImpl.internal(this);
}
