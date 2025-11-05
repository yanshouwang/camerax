import 'package:camerax_platform_interface/src/avfoundation.dart';
import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:camerax_platform_interface/src/ml.dart';
import 'package:camerax_platform_interface/src/video.dart';

abstract base class AVAnalyzerResultConsumerApi {
  AVAnalyzerResultConsumerApi.impl();

  factory AVAnalyzerResultConsumerApi({
    required void Function(AVAnalyzerResultApi value) accept,
  }) => CameraXPlugin.instance.$AVAnalyzerResultConsumerApi(accept: accept);
}

abstract base class ImageProxyConsumerApi {
  ImageProxyConsumerApi.impl();

  factory ImageProxyConsumerApi({
    required void Function(ImageProxyApi value) accept,
  }) => CameraXPlugin.instance.$ImageProxyConsumerApi(accept: accept);
}

abstract base class MlKitAnalyzerResultConsumerApi {
  MlKitAnalyzerResultConsumerApi.impl();

  factory MlKitAnalyzerResultConsumerApi({
    required void Function(MlKitAnalyzerResultApi value) accept,
  }) => CameraXPlugin.instance.$MlKitAnalyzerResultConsumerApi(accept: accept);
}

abstract base class VideoRecordEventConsumerApi {
  VideoRecordEventConsumerApi.impl();

  factory VideoRecordEventConsumerApi({
    required void Function(VideoRecordEventApi value) accept,
  }) => CameraXPlugin.instance.$VideoRecordEventConsumerApi(accept: accept);
}
