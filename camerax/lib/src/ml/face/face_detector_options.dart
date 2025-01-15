import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

final class FaceDetectorOptions {
  final $interface.FaceDetectorOptions _obj;

  FaceDetectorOptions({
    bool? enableTracking,
    $interface.FaceClassificationMode? classificationMode,
    $interface.FaceContourMode? contourMode,
    $interface.FaceLandmarkMode? landmarkMode,
    double? minFaceSize,
    $interface.FacePerformanceMode? performanceMode,
  }) : _obj = $interface.FaceDetectorOptions(
          enableTracking: enableTracking,
          classificationMode: classificationMode,
          contourMode: contourMode,
          landmarkMode: landmarkMode,
          minFaceSize: minFaceSize,
          performanceMode: performanceMode,
        );

  @internal
  $interface.FaceDetectorOptions get obj => _obj;
}
