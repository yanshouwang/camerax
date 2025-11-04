import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'face_detector_impl.dart';
import 'face_detector_options_impl.dart';

final class FaceDetectionImpl extends FaceDetectionApi {
  static Future<FaceDetectorApi> getClient([FaceDetectorOptionsApi? options]) async {
    final api = options == null
        ? await FaceDetectionApi.getClient1()
        : await FaceDetectionApi.getClient2(options.api);
    return FaceDetectorImpl.internal(api);
  }

  final FaceDetectionApi api;

  FaceDetectionImpl.internal(this.api) : super.impl();
}
