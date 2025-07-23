import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';

import 'vn_analyzer_result.dart';
import 'vn_detector.dart';

abstract base class VNAnalyzer extends Analyzer {
  VNAnalyzer.impl() : super.impl();

  factory VNAnalyzer({
    required List<VNDetector> detectors,
    required Consumer<VNAnalyzerResult> consumer,
  }) => CameraXPlugin.instance.newVNAnalyzer(
    detectors: detectors,
    consumer: consumer,
  );
}
