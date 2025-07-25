import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'detector_impl.dart';

final class FaceDetectorImpl extends FaceDetector with DetectorImpl {
  @override
  List<AVMetadataObjectTypeApi> get typeApis => [AVMetadataObjectTypeApi.face];

  FaceDetectorImpl.internal() : super.impl();

  factory FaceDetectorImpl({FaceDetectorOptions? options}) {
    return FaceDetectorImpl.internal();
  }
}

extension AVMetadataFaceObjectApiX on AVMetadataFaceObjectApi {
  Face implOfSize(SizeApi sizeApi) {
    return Face(
      boundingBox: bounds.implOf(sizeApi),
      allContours: [],
      allLandmarks: [],
      headEulerAngleX: rollAngle, // Roll
      headEulerAngleY: 0, // Pitch
      headEulerAngleZ: yawAngle, // Yaw
      leftEyeOpenProbability: null,
      rightEyeOpenProbability: null,
      smilingProbability: null,
      trackingId: faceID,
    );
  }
}
