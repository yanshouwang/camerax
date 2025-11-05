import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';

import 'face_detector_options_api.dart';

abstract base class FaceDetectorApi extends CloseableApi {
  FaceDetectorApi.impl() : super.impl();

  factory FaceDetectorApi() => CameraXPlugin.instance.$FaceDetectorApi();

  factory FaceDetectorApi.options(FaceDetectorOptionsApi options) =>
      CameraXPlugin.instance.$FaceDetectorApiOptions(options);
}
