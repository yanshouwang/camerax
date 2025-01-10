import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class FocusMeteringAction extends $base.FocusMeteringAction {
  final $native.FocusMeteringAction obj;

  FocusMeteringAction.$native(this.obj) : super.impl();

  @override
  Future<Duration> getAutoCancelDuration() async {
    // TODO: implement getAutoCancelDuration
    throw UnimplementedError();
  }

  @override
  Future<List<$base.MeteringPoint>> getMeteringPointsAe() {
    // TODO: implement getMeteringPointsAe
    throw UnimplementedError();
  }

  @override
  Future<List<$base.MeteringPoint>> getMeteringPointsAf() {
    // TODO: implement getMeteringPointsAf
    throw UnimplementedError();
  }

  @override
  Future<List<$base.MeteringPoint>> getMeteringPointsAwb() {
    // TODO: implement getMeteringPointsAwb
    throw UnimplementedError();
  }

  @override
  Future<bool> isAutoCancelEnabled() {
    // TODO: implement isAutoCancelEnabled
    throw UnimplementedError();
  }
}
