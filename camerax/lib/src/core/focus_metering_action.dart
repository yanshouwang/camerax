import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

import 'metering_point.dart';

class FocusMeteringAction {
  final $base.FocusMeteringAction _obj;

  FocusMeteringAction(
    (MeteringPoint, List<$base.MeteringMode>) first, {
    List<(MeteringPoint, List<$base.MeteringMode>)>? others,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) : _obj = $base.FocusMeteringAction(
          (first.$1.obj, first.$2),
          others: others?.map((other) => (other.$1.obj, other.$2)).toList(),
          disableAutoCancel: disableAutoCancel,
          autoCancelDuration: autoCancelDuration,
        );

  @internal
  $base.FocusMeteringAction get obj => _obj;
}
