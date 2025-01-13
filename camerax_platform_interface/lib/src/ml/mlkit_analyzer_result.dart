import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'detector.dart';

abstract base class MlKitAnalyzerResult extends PlatformInterface {
  static final _token = Object();

  final int timestamp;

  MlKitAnalyzerResult.impl({
    required this.timestamp,
  }) : super(token: _token);

  Future<Object?> getThrowable(Detector detector);
  Future<T?> getValue<T>(Detector<T> detector);
}
