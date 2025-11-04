import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'metering_point_impl.dart';

final class FocusMeteringActionImpl extends FocusMeteringActionApi {
  final FocusMeteringActionProxyApi api;

  FocusMeteringActionImpl.internal(this.api) : super.impl();

  factory FocusMeteringActionImpl(
    (MeteringPointApi, List<FocusMeteringActionMeteringMode>) point, {
    List<(MeteringPointApi, List<FocusMeteringActionMeteringMode>)>? morePoints,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) {
    final api = FocusMeteringActionProxyApi.build(
      point: point.api,
      morePoints: morePoints?.map((e) => e.api).toList(),
      disableAutoCancel: disableAutoCancel,
      autoCancelDuration: autoCancelDuration?.api,
    );
    return FocusMeteringActionImpl.internal(api);
  }

  @override
  Future<Duration> getAutoCancelDuration() => api
      .getAutoCancelDurationInMillis()
      .then((e) => Duration(milliseconds: e));

  @override
  Future<List<MeteringPointApi>> getMeteringPointsAe() =>
      api.getMeteringPointsAe().then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<List<MeteringPointApi>> getMeteringPointsAf() =>
      api.getMeteringPointsAf().then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<List<MeteringPointApi>> getMeteringPointsAwb() =>
      api.getMeteringPointsAwb().then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<bool> isAutoCancelEnabled() => api.isAutoCancelEnabled();
}

extension MeteringPointApiTupleX
    on (MeteringPointApi, List<FocusMeteringActionMeteringMode>) {
  MeteringPointTupleProxyApi get api => MeteringPointTupleProxyApi(
    point: $1.api,
    modes: $2.map((e) => e.api).toList(),
  );
}

extension DurationX on Duration {
  DurationTupleProxyApi get api {
    return DurationTupleProxyApi(
      duration: inMilliseconds,
      timeUnit: TimeUnitApi.milliseconds,
    );
  }
}

extension FocusMeteringActionMeteringModeX on FocusMeteringActionMeteringMode {
  FocusMeteringActionMeteringModeApi get api =>
      FocusMeteringActionMeteringModeApi.values[index];
}

extension FocusMeteringActionApiX on FocusMeteringActionApi {
  FocusMeteringActionProxyApi get api {
    final impl = this;
    if (impl is! FocusMeteringActionImpl) throw TypeError();
    return impl.api;
  }
}
