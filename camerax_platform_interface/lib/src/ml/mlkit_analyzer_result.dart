import 'detector.dart';

abstract base class MlKitAnalyzerResult {
  final int timestamp;

  MlKitAnalyzerResult.impl({
    required this.timestamp,
  });

  Future<T?> getValue<T>(Detector<T> detector);
  Future<Object?> getThrowable(Detector detector);
}
