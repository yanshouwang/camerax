import 'vn_detector.dart';
import 'vn_observation.dart';

abstract base class VNAnalyzerResult {
  final int timestamp;

  VNAnalyzerResult.impl({
    required this.timestamp,
  });

  Future<List<VNObservation>?> getValue(VNDetector detector);
  Future<Object?> getError(VNDetector detector);
}
