import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum FocusMeteringAction$MeteringMode { af, ae, awb }

abstract interface class FocusMeteringAction$Builder {
  factory FocusMeteringAction$Builder(
    MeteringPoint point, [
    List<FocusMeteringAction$MeteringMode>? meteringModes,
  ]) => FocusMeteringActionChannel.instance.createBuilder(point, meteringModes);

  Future<FocusMeteringAction$Builder> addPoint(
    MeteringPoint point, [
    List<FocusMeteringAction$MeteringMode>? meteringModes,
  ]);
  Future<FocusMeteringAction$Builder> disableAutoCancel();
  Future<FocusMeteringAction$Builder> setAutoCancelDuration(Duration duration);
  Future<FocusMeteringAction> build();
}

abstract interface class FocusMeteringAction {
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

abstract base class FocusMeteringActionChannel extends PlatformInterface {
  FocusMeteringActionChannel() : super(token: _token);

  static final _token = Object();

  static FocusMeteringActionChannel? _instance;

  static FocusMeteringActionChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(FocusMeteringActionChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  FocusMeteringAction$Builder createBuilder(
    MeteringPoint point, [
    List<FocusMeteringAction$MeteringMode>? meteringModes,
  ]);
}
