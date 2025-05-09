import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'metering_mode_impl.dart';
import 'metering_point_impl.dart';

final class FocusMeteringActionImpl extends FocusMeteringActionChannel {
  final FocusMeteringActionApi api;

  FocusMeteringActionImpl.impl(this.api) : super.impl();

  factory FocusMeteringActionImpl(
    (MeteringPoint, List<MeteringMode>) first, {
    List<(MeteringPoint, List<MeteringMode>)>? others,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) {
    final api = FocusMeteringActionApi.build(
      first: first.api,
      others: others?.map((e) => e.api).toList(),
      disableAutoCancel: disableAutoCancel,
      autoCancelDuration: autoCancelDuration?.api,
    );
    return FocusMeteringActionImpl.impl(api);
  }

  @override
  Future<Duration> getAutoCancelDuration() => api
      .getAutoCancelDurationInMillis()
      .then((e) => Duration(milliseconds: e));

  @override
  Future<List<MeteringPoint>> getMeteringPointsAe() =>
      api.getMeteringPointsAe().then((e1) => e1.map((e2) => e2.impl).toList());

  @override
  Future<List<MeteringPoint>> getMeteringPointsAf() =>
      api.getMeteringPointsAf().then((e1) => e1.map((e2) => e2.impl).toList());

  @override
  Future<List<MeteringPoint>> getMeteringPointsAwb() =>
      api.getMeteringPointsAwb().then((e1) => e1.map((e2) => e2.impl).toList());

  @override
  Future<bool> isAutoCancelEnabled() => api.isAutoCancelEnabled();
}

extension MeteringPointTupleX on (MeteringPoint, List<MeteringMode>) {
  MeteringPointTupleApi get api {
    final point = this.$1;
    if (point is! MeteringPointImpl) {
      throw TypeError();
    }
    return MeteringPointTupleApi(
      point: point.api,
      modes: $2.map((e) => e.api).toList(),
    );
  }
}

extension DurationX on Duration {
  DurationTupleApi get api {
    return DurationTupleApi(
      duration: inMilliseconds,
      timeUnit: TimeUnitApi.milliseconds,
    );
  }
}
