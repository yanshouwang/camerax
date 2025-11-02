import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'detector_impl.dart';

final class FaceDetectorOptionsImpl extends FaceDetectorOptions {
  final FaceDetectorOptionsApi api;

  FaceDetectorOptionsImpl.internal(this.api) : super.impl();

  factory FaceDetectorOptionsImpl({
    bool? enableTracking,
    FaceClassificationMode? classificationMode,
    FaceContourMode? contourMode,
    FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    FacePerformanceMode? performanceMode,
  }) {
    final api = FaceDetectorOptionsApi.build(
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

final class FaceDetectorImpl extends FaceDetector with DetectorMixin {
  @override
  final FaceDetectorApi api;

  FaceDetectorImpl.internal(this.api) : super.impl();

  factory FaceDetectorImpl({FaceDetectorOptions? options}) {
    final api = FaceDetectorApi(options: options?.api);
    return FaceDetectorImpl.internal(api);
  }
}

extension FaceDetectorOptionsX on FaceDetectorOptions {
  FaceDetectorOptionsApi get api {
    final impl = this;
    if (impl is! FaceDetectorOptionsImpl) throw TypeError();
    return impl.api;
  }
}

extension FaceApiX on FaceApi {
  Face get impl {
    return Face(
      boundingBox: boundingBox.impl,
      allContours: allContours.map((e) => e.impl).toList(),
      allLandmarks: allLandmarks.map((e) => e.impl).toList(),
      headEulerAngleX: headEulerAngleX,
      headEulerAngleY: headEulerAngleY,
      headEulerAngleZ: headEulerAngleZ,
      leftEyeOpenProbability: leftEyeOpenProbability,
      rightEyeOpenProbability: rightEyeOpenProbability,
      smilingProbability: smilingProbability,
      trackingId: trackingId,
    );
  }
}

extension FaceContourApiX on FaceContourApi {
  FaceContour get impl {
    return FaceContour(
      type: type.impl,
      points: points.map((e) => e.impl).toList(),
    );
  }
}

extension FaceLandmarkApiX on FaceLandmarkApi {
  FaceLandmark get impl {
    return FaceLandmark(type: type.impl, position: position.impl);
  }
}

extension FaceClassificationModeX on FaceClassificationMode {
  FaceClassificationModeApi get api => FaceClassificationModeApi.values[index];
}

extension FaceContourModeX on FaceContourMode {
  FaceContourModeApi get api => FaceContourModeApi.values[index];
}

extension FaceContourTypeApiX on FaceContourTypeApi {
  FaceContourType get impl => FaceContourType.values[index];
}

extension FaceLandmarkModeX on FaceLandmarkMode {
  FaceLandmarkModeApi get api => FaceLandmarkModeApi.values[index];
}

extension FaceLandmarkTypeApiX on FaceLandmarkTypeApi {
  FaceLandmarkType get impl => FaceLandmarkType.values[index];
}

extension FacePerformanceModeX on FacePerformanceMode {
  FacePerformanceModeApi get api => FacePerformanceModeApi.values[index];
}
