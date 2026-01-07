import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FaceDetectorOptions$BuilderImpl
    implements FaceDetectorOptions$Builder {
  final FaceDetectorOptionsBuilderProxyApi api;

  FaceDetectorOptions$BuilderImpl.internal(this.api);

  @override
  Future<FaceDetectorOptions$Builder> enableTracking() =>
      api.enableTracking().then((e) => e.impl);

  @override
  Future<FaceDetectorOptions$Builder> setClassificationMode(
    FaceDetectorOptions$ClassificationMode classificationMode,
  ) => api.setClassificationMode(classificationMode.api).then((e) => e.impl);

  @override
  Future<FaceDetectorOptions$Builder> setContourMode(
    FaceDetectorOptions$ContourMode contourMode,
  ) => api.setContourMode(contourMode.api).then((e) => e.impl);

  @override
  Future<FaceDetectorOptions$Builder> setLandmarkMode(
    FaceDetectorOptions$LandmarkMode landmarkMode,
  ) => api.setLandmarkMode(landmarkMode.api).then((e) => e.impl);

  @override
  Future<FaceDetectorOptions$Builder> setMinFaceSize(double minFaceSize) =>
      api.setMinFaceSize(minFaceSize).then((e) => e.impl);

  @override
  Future<FaceDetectorOptions$Builder> setPerformanceMode(
    FaceDetectorOptions$PerformanceMode performanceMode,
  ) => api.setPerformanceMode(performanceMode.api).then((e) => e.impl);

  @override
  Future<FaceDetectorOptions> build() => api.build().then((e) => e.impl);
}

final class FaceDetectorOptionsImpl implements FaceDetectorOptions {
  final FaceDetectorOptionsProxyApi api;

  FaceDetectorOptionsImpl.internal(this.api);
}

final class FaceDetectorOptionsChannelImpl extends FaceDetectorOptionsChannel {
  @override
  FaceDetectorOptions$Builder createBuilder() {
    final api = FaceDetectorOptionsBuilderProxyApi();
    return FaceDetectorOptions$BuilderImpl.internal(api);
  }
}

extension FaceDetectorOptions$ClassificationModeX
    on FaceDetectorOptions$ClassificationMode {
  FaceDetectorOptionsClassificationModeApi get api =>
      FaceDetectorOptionsClassificationModeApi.values[index];
}

extension FaceDetectorOptions$ContourModeX on FaceDetectorOptions$ContourMode {
  FaceDetectorOptionsContourModeApi get api =>
      FaceDetectorOptionsContourModeApi.values[index];
}

extension FaceDetectorOptions$LandmarkModeX
    on FaceDetectorOptions$LandmarkMode {
  FaceDetectorOptionsLandmarkModeApi get api =>
      FaceDetectorOptionsLandmarkModeApi.values[index];
}

extension FaceDetectorOptioins$PerformanceModeX
    on FaceDetectorOptions$PerformanceMode {
  FaceDetectorOptionsPerformanceModeApi get api =>
      FaceDetectorOptionsPerformanceModeApi.values[index];
}

extension FaceDetectorOptionsBuilderProxyApiX
    on FaceDetectorOptionsBuilderProxyApi {
  FaceDetectorOptions$Builder get impl =>
      FaceDetectorOptions$BuilderImpl.internal(this);
}

extension FaceDetectorOptionsX on FaceDetectorOptions {
  FaceDetectorOptionsProxyApi get api {
    final impl = this;
    if (impl is! FaceDetectorOptionsImpl) throw TypeError();
    return impl.api;
  }
}

extension FaceDetectorOptionsProxyApiX on FaceDetectorOptionsProxyApi {
  FaceDetectorOptions get impl => FaceDetectorOptionsImpl.internal(this);
}
