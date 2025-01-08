import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class ExposureState extends $base.ExposureState {
  @override
  final int exposureCompensationIndex;
  @override
  final $base.Range<int> exposureCompensationRange;
  @override
  final double exposureCompensationStep;
  @override
  final bool isExposureCompensationSupported;

  ExposureState({
    required this.exposureCompensationIndex,
    required this.exposureCompensationRange,
    required this.exposureCompensationStep,
    required this.isExposureCompensationSupported,
  }) : super.impl();
}
