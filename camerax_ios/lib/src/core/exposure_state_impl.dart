// import 'package:camerax_ios/src/api.dart';
// import 'package:camerax_ios/src/common.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// final class ExposureStateImpl implements ExposureState {
//   final ExposureStateProxyApi api;

//   ExposureStateImpl.internal(this.api);

//   @override
//   int get exposureCompensationIndex => api.exposureCompensationIndex;
//   @override
//   Range<int> get exposureCompensationRange =>
//       api.exposureCompensationRange.impl;
//   @override
//   double get exposureCompensationStep => api.exposureCompensationStep;
//   @override
//   bool get isExposureCompensationSupported =>
//       api.isExposureCompensationSupported;
// }

// extension ExposureStateProxyApiX on ExposureStateProxyApi {
//   ExposureState get impl => ExposureStateImpl.internal(this);
// }
