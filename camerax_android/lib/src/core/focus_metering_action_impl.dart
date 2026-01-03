import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FocusMeteringAction$BuilderImpl
    implements FocusMeteringAction$Builder {
  final FocusMeteringActionBuilderProxyApi api;

  FocusMeteringAction$BuilderImpl.internal(this.api);

  @override
  Future<FocusMeteringAction$Builder> addPoint(
    MeteringPoint point, [
    List<FocusMeteringAction$MeteringMode>? meteringModes,
  ]) => meteringModes == null
      ? api.addPoint1(point.api).then((e) => e.impl)
      : api
            .addPoint2(point.api, meteringModes.map((e) => e.api).toList())
            .then((e) => e.impl);

  @override
  Future<FocusMeteringAction$Builder> disableAutoCancel() =>
      api.disableAutoCancel().then((e) => e.impl);

  @override
  Future<FocusMeteringAction$Builder> setAutoCancelDuration(
    Duration duration,
  ) => api
      .setAutoCancelDuration(duration.inMicroseconds, TimeUnitApi.microseconds)
      .then((e) => e.impl);

  @override
  Future<FocusMeteringAction> build() => api.build().then((e) => e.impl);
}

final class FocusMeteringActionImpl implements FocusMeteringAction {
  final FocusMeteringActionProxyApi api;

  FocusMeteringActionImpl.internal(this.api);

  @override
  Future<Duration> getAutoCancelDuration() => api
      .getAutoCancelDurationInMillis()
      .then((e) => Duration(milliseconds: e));

  @override
  Future<List<MeteringPoint>> getMeteringPointsAe() =>
      api.getMeteringPointsAe().then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<List<MeteringPoint>> getMeteringPointsAf() =>
      api.getMeteringPointsAf().then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<List<MeteringPoint>> getMeteringPointsAwb() =>
      api.getMeteringPointsAwb().then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<bool> isAutoCancelEnabled() => api.isAutoCancelEnabled();
}

final class FocusMeteringActionChannelImpl extends FocusMeteringActionChannel {
  @override
  FocusMeteringAction$Builder createBuilder(
    MeteringPoint point, [
    List<FocusMeteringAction$MeteringMode>? meteringModes,
  ]) {
    final api = meteringModes == null
        ? FocusMeteringActionBuilderProxyApi.new1(point: point.api)
        : FocusMeteringActionBuilderProxyApi.new2(
            point: point.api,
            meteringModes: meteringModes.map((e) => e.api).toList(),
          );
    return FocusMeteringAction$BuilderImpl.internal(api);
  }
}

extension FocusMeteringAction$MeteringModeX
    on FocusMeteringAction$MeteringMode {
  FocusMeteringActionMeteringModeApi get api =>
      FocusMeteringActionMeteringModeApi.values[index];
}

extension FocusMeteringActionBuilderProxyApiX
    on FocusMeteringActionBuilderProxyApi {
  FocusMeteringAction$Builder get impl =>
      FocusMeteringAction$BuilderImpl.internal(this);
}

extension FocusMeteringActionX on FocusMeteringAction {
  FocusMeteringActionProxyApi get api {
    final impl = this;
    if (impl is! FocusMeteringActionImpl) throw TypeError();
    return impl.api;
  }
}

extension FocusMeteringActionProxyApiX on FocusMeteringActionProxyApi {
  FocusMeteringAction get impl => FocusMeteringActionImpl.internal(this);
}
