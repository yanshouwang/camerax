import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

import 'metering_point.dart';

class FocusMeteringAction {
  final $interface.FocusMeteringAction _obj;

  FocusMeteringAction(
    (MeteringPoint, List<$interface.MeteringMode>) first, {
    List<(MeteringPoint, List<$interface.MeteringMode>)>? others,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) : _obj = $interface.FocusMeteringAction(
          (first.$1.obj, first.$2),
          others: others?.map((other) => (other.$1.obj, other.$2)).toList(),
          disableAutoCancel: disableAutoCancel,
          autoCancelDuration: autoCancelDuration,
        );

  @internal
  $interface.FocusMeteringAction get obj => _obj;
}
