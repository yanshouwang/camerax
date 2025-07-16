import 'detector.dart';

abstract base class MlKitAnalyzerResult {
  final int timestamp;

  MlKitAnalyzerResult.impl({
    required this.timestamp,
  });

  Future<Object?> getThrowable(Detector detector);
  Future<T?> getValue<T>(Detector<T> detector);
}
