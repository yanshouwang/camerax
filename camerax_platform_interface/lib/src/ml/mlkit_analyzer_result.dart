import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'detector.dart';

final _token = Object();

abstract interface class MlKitAnalyzerResult {
  int get timestamp;

  Future<Object?> getThrowable(Detector detector);
  Future<T?> getValue<T>(Detector<T> detector);
}

abstract base class MlKitAnalyzerResultChannel extends PlatformInterface
    implements MlKitAnalyzerResult {
  @override
  final int timestamp;

  MlKitAnalyzerResultChannel.impl({
    required this.timestamp,
  }) : super(token: _token);
}
