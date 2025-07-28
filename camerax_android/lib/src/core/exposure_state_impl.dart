import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ExposureStateApiX on ExposureStateApi {
  ExposureState get impl {
    return ExposureState(
      exposureCompensationIndex: exposureCompensationIndex,
      exposureCompensationRange: exposureCompensationRange.impl,
      exposureCompensationStep: exposureCompensationStep,
      isExposureCompensationSupported: isExposureCompensationSupported,
    );
  }
}
