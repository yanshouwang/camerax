import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'metering_mode.dart';
import 'metering_point.dart';

final class FocusMeteringAction extends $interface.FocusMeteringAction {
  final $native.FocusMeteringAction obj;

  FocusMeteringAction.$native(this.obj) : super.impl();

  factory FocusMeteringAction(
    ($interface.MeteringPoint, List<$interface.MeteringMode>) first, {
    List<($interface.MeteringPoint, List<$interface.MeteringMode>)>? others,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) {
    final obj = $native.FocusMeteringAction.build(
      first: first.obj,
      others: others?.map((other) => other.obj).toList(),
      disableAutoCancel: disableAutoCancel,
      autoCancelDuration: autoCancelDuration?.obj,
    );
    return FocusMeteringAction.$native(obj);
  }

  @override
  Future<Duration> getAutoCancelDuration() async {
    final inMillis = await obj.getAutoCancelDurationInMillis();
    return Duration(
      milliseconds: inMillis,
    );
  }

  @override
  Future<List<$interface.MeteringPoint>> getMeteringPointsAe() async {
    final objs = await obj.getMeteringPointsAe();
    return objs.map((obj) => obj.args).toList();
  }

  @override
  Future<List<$interface.MeteringPoint>> getMeteringPointsAf() async {
    final objs = await obj.getMeteringPointsAf();
    return objs.map((obj) => obj.args).toList();
  }

  @override
  Future<List<$interface.MeteringPoint>> getMeteringPointsAwb() async {
    final objs = await obj.getMeteringPointsAwb();
    return objs.map((obj) => obj.args).toList();
  }

  @override
  Future<bool> isAutoCancelEnabled() async {
    final value = await obj.isAutoCancelEnabled();
    return value;
  }
}

extension on ($interface.MeteringPoint, List<$interface.MeteringMode>) {
  $native.MeteringPointArgs get obj {
    final point = this.$1;
    if (point is! MeteringPoint) {
      throw TypeError();
    }
    return $native.MeteringPointArgs(
      point: point.obj,
      modes: $2.map((mode) => mode.obj).toList(),
    );
  }
}

extension on Duration {
  $native.DurationArgs get obj {
    return $native.DurationArgs(
      duration: inMilliseconds,
      timeUnit: $native.TimeUnit.milliseconds,
    );
  }
}
