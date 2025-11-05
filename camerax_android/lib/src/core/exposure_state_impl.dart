import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ExposureStateImpl extends ExposureState {
  final ExposureStateProxyApi api;

  ExposureStateImpl.internal(this.api) : super.impl();

  @override
  int get exposureCompensationIndex => api.exposureCompensationIndex;
  @override
  RangeApi get exposureCompensationRange => api.exposureCompensationRange.impl;
  @override
  double get exposureCompensationStep => api.exposureCompensationStep;
  @override
  bool get isExposureCompensationSupported =>
      api.isExposureCompensationSupported;
}

extension ExposureStateProxyApiX on ExposureStateProxyApi {
  ExposureState get impl => ExposureStateImpl.internal(this);
}
