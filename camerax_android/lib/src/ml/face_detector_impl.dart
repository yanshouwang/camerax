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
    return FaceDetectorOptionsImpl.api(api);
  }
}

final class FaceDetectorImpl extends FaceDetector with DetectorMixin {
  @override
  final FaceDetectorApi api;

  FaceDetectorImpl.internal(this.api) : super.impl();

  factory FaceDetectorImpl({FaceDetectorOptions? options}) {
    final api = FaceDetectorApi(options: options?.api);
    return FaceDetectorImpl.api(api);
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
  FaceClassificationModeApi get api {
    switch (this) {
      case FaceClassificationMode.none:
        return FaceClassificationModeApi.none;
      case FaceClassificationMode.all:
        return FaceClassificationModeApi.all;
    }
  }
}

extension FaceContourModeX on FaceContourMode {
  FaceContourModeApi get api {
    switch (this) {
      case FaceContourMode.none:
        return FaceContourModeApi.none;
      case FaceContourMode.all:
        return FaceContourModeApi.all;
    }
  }
}

extension FaceContourTypeApiX on FaceContourTypeApi {
  FaceContourType get impl {
    switch (this) {
      case FaceContourTypeApi.face:
        return FaceContourType.face;
      case FaceContourTypeApi.leftCheek:
        return FaceContourType.leftCheek;
      case FaceContourTypeApi.leftEye:
        return FaceContourType.leftEye;
      case FaceContourTypeApi.leftEyebrowBottom:
        return FaceContourType.leftEyebrowBottom;
      case FaceContourTypeApi.leftEyebrowTop:
        return FaceContourType.leftEyebrowTop;
      case FaceContourTypeApi.lowerLipBottom:
        return FaceContourType.lowerLipBottom;
      case FaceContourTypeApi.lowerLipTop:
        return FaceContourType.lowerLipTop;
      case FaceContourTypeApi.noseBottom:
        return FaceContourType.noseBottom;
      case FaceContourTypeApi.noseBridge:
        return FaceContourType.noseBridge;
      case FaceContourTypeApi.rightCheek:
        return FaceContourType.rightCheek;
      case FaceContourTypeApi.rightEye:
        return FaceContourType.rightEye;
      case FaceContourTypeApi.rightEyebrowBottom:
        return FaceContourType.rightEyebrowBottom;
      case FaceContourTypeApi.rightEyebrowTop:
        return FaceContourType.rightEyebrowTop;
      case FaceContourTypeApi.upperLipBottom:
        return FaceContourType.upperLipBottom;
      case FaceContourTypeApi.upperLipTop:
        return FaceContourType.upperLipTop;
    }
  }
}

extension FaceLandmarkModeX on FaceLandmarkMode {
  FaceLandmarkModeApi get api {
    switch (this) {
      case FaceLandmarkMode.none:
        return FaceLandmarkModeApi.none;
      case FaceLandmarkMode.all:
        return FaceLandmarkModeApi.all;
    }
  }
}

extension FaceLandmarkTypeApiX on FaceLandmarkTypeApi {
  FaceLandmarkType get impl {
    switch (this) {
      case FaceLandmarkTypeApi.leftCheek:
        return FaceLandmarkType.leftCheek;
      case FaceLandmarkTypeApi.leftEar:
        return FaceLandmarkType.leftEar;
      case FaceLandmarkTypeApi.leftEye:
        return FaceLandmarkType.leftEye;
      case FaceLandmarkTypeApi.mouthBottom:
        return FaceLandmarkType.mouthBottom;
      case FaceLandmarkTypeApi.mouthLeft:
        return FaceLandmarkType.mouthLeft;
      case FaceLandmarkTypeApi.mouthRight:
        return FaceLandmarkType.mouthRight;
      case FaceLandmarkTypeApi.noseBase:
        return FaceLandmarkType.noseBase;
      case FaceLandmarkTypeApi.rightCheek:
        return FaceLandmarkType.rightCheek;
      case FaceLandmarkTypeApi.rightEar:
        return FaceLandmarkType.rightEar;
      case FaceLandmarkTypeApi.rightEye:
        return FaceLandmarkType.rightEye;
    }
  }
}

extension FacePerformanceModeX on FacePerformanceMode {
  FacePerformanceModeApi get api {
    switch (this) {
      case FacePerformanceMode.fast:
        return FacePerformanceModeApi.fast;
      case FacePerformanceMode.accurate:
        return FacePerformanceModeApi.accurate;
    }
  }
}
