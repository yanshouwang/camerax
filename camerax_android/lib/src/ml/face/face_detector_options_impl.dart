import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FaceDetectorOptionsImpl extends FaceDetectorOptions {
  final FaceDetectorOptionsProxyApi api;

  FaceDetectorOptionsImpl.internal(this.api) : super.impl();

  factory FaceDetectorOptionsImpl({
    bool? enableTracking,
    FaceDetectorOptionsClassificationMode? classificationMode,
    FaceDetectorOptionsContourMode? contourMode,
    FaceDetectorOptionsLandmarkMode? landmarkMode,
    double? minFaceSize,
    FaceDetectorOptionsPerformanceMode? performanceMode,
  }) {
    final api = FaceDetectorOptionsProxyApi.build(
      enableTracking: enableTracking,
      classificationMode: classificationMode?.api,
      contourMode: contourMode?.api,
      landmarkMode: landmarkMode?.api,
      minFaceSize: minFaceSize,
      performanceMode: performanceMode?.api,
    );
    return FaceDetectorOptionsImpl.internal(api);
  }
}

extension FaceDetectorOptionsClassificationModeX
    on FaceDetectorOptionsClassificationMode {
  FaceDetectorOptionsClassificationModeApi get api =>
      FaceDetectorOptionsClassificationModeApi.values[index];
}

extension FaceDetectorOptionsContourModeX on FaceDetectorOptionsContourMode {
  FaceDetectorOptionsContourModeApi get api =>
      FaceDetectorOptionsContourModeApi.values[index];
}

extension FaceDetectorOptionsLandmarkModeX on FaceDetectorOptionsLandmarkMode {
  FaceDetectorOptionsLandmarkModeApi get api =>
      FaceDetectorOptionsLandmarkModeApi.values[index];
}

extension FaceDetectorOptioinsPerformanceModeX
    on FaceDetectorOptionsPerformanceMode {
  FaceDetectorOptionsPerformanceModeApi get api =>
      FaceDetectorOptionsPerformanceModeApi.values[index];
}

extension FaceDetectorOptionsX on FaceDetectorOptions {
  FaceDetectorOptionsProxyApi get api {
    final impl = this;
    if (impl is! FaceDetectorOptionsImpl) throw TypeError();
    return impl.api;
  }
}
