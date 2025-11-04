import 'package:camerax_platform_interface/src/camerax_plugin.dart';

import 'face_detector_api.dart';
import 'face_detector_options_api.dart';

abstract base class FaceDetectionApi {
  static Future<FaceDetectorApi> getClient([FaceDetectorOptionsApi? options]) =>
      CameraXPlugin.instance.$FaceDetectionApiGetClient(options);

  FaceDetectionApi.impl();
}
