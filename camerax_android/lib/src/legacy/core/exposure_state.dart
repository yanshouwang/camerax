import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'range.dart';

final class ExposureState extends $base.ExposureState {
  final $native.ExposureState obj;

  ExposureState.$native(this.obj) : super.impl();

  @override
  Future<int> getExposureCompensationIndex() async {
    final value = await obj.getExposureCompensationIndex();
    return value;
  }

  @override
  Future<$base.Range<int>> getExposureCompensationRange() async {
    final obj = await this.obj.getExposureCompensationRange();
    return IntRange.$native(obj);
  }

  @override
  Future<double> getExposureCompensationStep() async {
    final value = await obj.getExposureCompensationStep();
    return value;
  }

  @override
  Future<bool> isExposureCompensationSupported() async {
    final value = await obj.isExposureCompensationSupported();
    return value;
  }
}
