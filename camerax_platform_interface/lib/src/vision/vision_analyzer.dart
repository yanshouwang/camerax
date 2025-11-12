import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'vision_object.dart';

abstract base class VisionAnalyzerResult {
  List<VisionObject> get objects;

  VisionAnalyzerResult.impl();
}

abstract base class VisionAnalyzer extends ImageAnalysisAnalyzer {
  VisionAnalyzer.impl() : super.impl();

  factory VisionAnalyzer({
    List<VisionObjectType>? types,
    required Consumer<VisionAnalyzerResult> consumer,
  }) =>
      CameraXPlugin.instance.$VisionAnalyzer(types: types, consumer: consumer);
}
