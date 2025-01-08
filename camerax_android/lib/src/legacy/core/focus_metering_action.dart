import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/native_comparator.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class FocusMeteringAction extends $base.FocusMeteringAction
    with NativeComparator {
  @override
  final $native.FocusMeteringAction obj;

  FocusMeteringAction.$native(this.obj) : super.impl();

  @override
  // TODO: implement autoCancelDuration
  Duration get autoCancelDuration => throw UnimplementedError();

  @override
  // TODO: implement isAutoCancelEnabled
  bool get isAutoCancelEnabled => throw UnimplementedError();

  @override
  // TODO: implement meteringPointsAe
  List<$base.MeteringPoint> get meteringPointsAe => throw UnimplementedError();

  @override
  // TODO: implement meteringPointsAf
  List<$base.MeteringPoint> get meteringPointsAf => throw UnimplementedError();

  @override
  // TODO: implement meteringPointsAwb
  List<$base.MeteringPoint> get meteringPointsAwb => throw UnimplementedError();
}
