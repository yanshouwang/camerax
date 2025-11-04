import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'metering_point_api.dart';

enum FocusMeteringActionMeteringMode { af, ae, awb }

abstract base class FocusMeteringActionApi {
  FocusMeteringActionApi.impl();

  factory FocusMeteringActionApi(
    (MeteringPointApi, List<FocusMeteringActionMeteringMode>) point, {
    List<(MeteringPointApi, List<FocusMeteringActionMeteringMode>)>? morePoints,
    bool? disableAutoCancel,
    Duration? autoCancelDuration,
  }) => CameraXPlugin.instance.$FocusMeteringActionApi(
    point,
    morePoints: morePoints,
    disableAutoCancel: disableAutoCancel,
    autoCancelDuration: autoCancelDuration,
  );

  /// Returns auto-cancel duration. Returns 0 if auto-cancel is disabled.
  Future<Duration> getAutoCancelDuration();

  /// Returns all MeteringPoints used for AE regions.
  Future<List<MeteringPointApi>> getMeteringPointsAe();

  /// Returns all MeteringPoints used for AF regions.
  Future<List<MeteringPointApi>> getMeteringPointsAf();

  /// Returns all MeteringPoints used for AWB regions.
  Future<List<MeteringPointApi>> getMeteringPointsAwb();

  /// Returns if auto-cancel is enabled or not.
  Future<bool> isAutoCancelEnabled();
}
