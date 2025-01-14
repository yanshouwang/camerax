import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

final class FaceDetectorOptions {
  final $base.FaceDetectorOptions _obj;

  FaceDetectorOptions({
    bool? enableTracking,
    $base.FaceClassificationMode? classificationMode,
    $base.FaceContourMode? contourMode,
    $base.FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    $base.FacePerformanceMode? performanceMode,
  }) : _obj = $base.FaceDetectorOptions(
          enableTracking: enableTracking,
          classificationMode: classificationMode,
          contourMode: contourMode,
          landmarkMode: landmarkMode,
          minFaceSize: minFaceSize,
          performanceMode: performanceMode,
        );

  @internal
  $base.FaceDetectorOptions get obj => _obj;
}
