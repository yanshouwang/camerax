import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:camerax_platform_interface/src/ml.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class MlKitAnalyzer$Result {
  int get timestamp;

  Future<T?> getValue<T>(Detector<T> detector);
  Future<Object?> getThrowable(Detector detector);
}

abstract interface class MlKitAnalyzer implements ImageAnalysis$Analyzer {
  factory MlKitAnalyzer({
    required List<Detector> detectors,
    required ImageAnalysis$CoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzer$Result> consumer,
  }) => MlKitAnalyzerChannel.instance.create(
    detectors: detectors,
    targetCoordinateSystem: targetCoordinateSystem,
    consumer: consumer,
  );
}

abstract base class MlKitAnalyzerChannel extends PlatformInterface {
  MlKitAnalyzerChannel() : super(token: _token);

  static final _token = Object();

  static MlKitAnalyzerChannel? _instance;

  static MlKitAnalyzerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(MlKitAnalyzerChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  MlKitAnalyzer create({
    required List<Detector> detectors,
    required ImageAnalysis$CoordinateSystem targetCoordinateSystem,
    required Consumer<MlKitAnalyzer$Result> consumer,
  });
}
