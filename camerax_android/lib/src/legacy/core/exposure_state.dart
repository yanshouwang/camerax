import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension ExposureStateObj on $native.ExposureState {
  $base.ExposureState get args {
    return $base.ExposureState(
      exposureCompensationIndex: exposureCompensationIndex,
      exposureCompensationRange: exposureCompensationRange.args,
      exposureCompensationStep: exposureCompensationStep,
      isExposureCompensationSupported: isExposureCompensationSupported,
    );
  }
}
