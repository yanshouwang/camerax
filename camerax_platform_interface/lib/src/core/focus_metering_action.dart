import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'metering_mode.dart';
import 'metering_point.dart';

abstract base class FocusMeteringAction {
  FocusMeteringAction.impl();

  factory FocusMeteringAction(
    (MeteringPoint, List<MeteringMode>) first, {
    List<(MeteringPoint, List<MeteringMode>)>? others,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) =>
      CameraXPlugin.instance.newFocusMeteringAction(
        first,
        others: others,
        disableAutoCancel: disableAutoCancel,
        autoCancelDuration: autoCancelDuration,
      );

  /// Returns auto-cancel duration. Returns 0 if auto-cancel is disabled.
  Future<Duration> getAutoCancelDuration();

  /// Returns all MeteringPoints used for AE regions.
  Future<List<MeteringPoint>> getMeteringPointsAe();

  /// Returns all MeteringPoints used for AF regions.
  Future<List<MeteringPoint>> getMeteringPointsAf();

  /// Returns all MeteringPoints used for AWB regions.
  Future<List<MeteringPoint>> getMeteringPointsAwb();

  /// Returns if auto-cancel is enabled or not.
  Future<bool> isAutoCancelEnabled();
}
