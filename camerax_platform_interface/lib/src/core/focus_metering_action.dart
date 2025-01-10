import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'metering_point.dart';

/// A configuration used to trigger a focus and/or metering action.
///
/// A FocusMeteringAction must be created by the Builder. To construct a Builder,
/// a MeteringPoint is required to specify the focus/metering area. Apps can use
/// various MeteringPointFactory to create the points. After the FocusMeteringAction
/// is built, apps can pass it to startFocusAndMetering to initiate the focus and
/// metering action.
///
/// When specifying a MeteringPoint, a metering mode can also be specified. Metering
/// mode is a combination of flags consisting of FLAG_AF, FLAG_AE, and FLAG_AWB.
/// This combination indicates whether the MeteringPoint is used to set an AF(Auto
/// Focus) region, AE(Auto Exposure) region or AWB(Auto White Balance) region.
/// The default meteringMode is FLAG_AF | FLAG_AE | FLAG_AWB which means the point
/// is used for all AF/AE/AWB regions. Apps can set the proper metering mode to
/// optionally exclude some 3A regions. Multiple regions for specific 3A types
/// are also supported via addPoint or addPoint. An app can also use this API to
/// enable different regions for AF and AE respectively.
///
/// If any AF points are specified, it will trigger autofocus to start a manual
/// scan. When focus is locked and the specified AF/AE/AWB regions are updated in
/// capture result, the returned ListenableFuture in startFocusAndMetering will
/// complete with isFocusSuccessful set to indicate if focus is done successfully
/// or not. If an AF point is not specified, it will not trigger autofocus and
/// simply wait for specified AE/AWB regions being updated to complete the returned
/// ListenableFuture. In the case of AF points not specified, isFocusSuccessful
/// will be set to false. If Af points are specified but current camera does not
/// support auto focus, isFocusSuccessful will be set to true .
///
/// App can set a auto-cancel duration to let CameraX call cancelFocusAndMetering
/// automatically in the specified duration. By default the auto-cancel duration
/// is 5 seconds. Apps can call disableAutoCancel to disable auto-cancel.
abstract base class FocusMeteringAction extends PlatformInterface {
  static final _token = Object();

  FocusMeteringAction.impl() : super(token: _token);

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
