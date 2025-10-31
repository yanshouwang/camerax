import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'av_metadata_object.dart';

abstract base class AVAnalyzerResult {
  List<AVMetadataObject> get objects;
}

abstract base class AVAnalyzer extends ImageAnalysisAnalyzer {
  AVAnalyzer.impl() : super.impl();

  factory AVAnalyzer({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzerResult> consumer,
  }) => CameraXPlugin.instance.newAVAnalyzer(types: types, consumer: consumer);
}
