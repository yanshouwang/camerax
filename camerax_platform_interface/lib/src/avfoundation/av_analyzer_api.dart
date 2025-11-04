import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'av_metadata_object_api.dart';

abstract base class AVAnalyzerResultApi {
  List<AVMetadataObjectApi> get objects;

  AVAnalyzerResultApi.impl();
}

abstract base class AVAnalyzerApi extends ImageAnalysisAnalyzerApi {
  AVAnalyzerApi.impl() : super.impl();

  factory AVAnalyzerApi({
    List<AVMetadataObjectType>? types,
    required AVAnalyzerResultConsumerApi consumer,
  }) => CameraXPlugin.instance.$AVAnalyzerApi(types: types, consumer: consumer);
}
