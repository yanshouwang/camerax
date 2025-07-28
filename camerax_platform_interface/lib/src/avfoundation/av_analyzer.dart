import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'av_metadata_object.dart';

abstract base class AVAnalyzer extends Analyzer {
  AVAnalyzer.impl() : super.impl();

  factory AVAnalyzer({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzerResult> consumer,
  }) => CameraXPlugin.instance.newAVAnalyzer(types: types, consumer: consumer);
}

final class AVAnalyzerResult {
  final List<AVMetadataObject> objects;

  const AVAnalyzerResult({required this.objects});
}
