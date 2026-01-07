import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:camerax_platform_interface/src/visionx.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class VisionAnalyzer$Result {
  List<VisionObject> get objects;
}

abstract interface class VisionAnalyzer implements ImageAnalysis$Analyzer {
  factory VisionAnalyzer({
    List<VisionObjectType>? types,
    required Consumer<VisionAnalyzer$Result> consumer,
  }) => VisionAnalyzerChannel.instance.create(types: types, consumer: consumer);
}

abstract base class VisionAnalyzerChannel extends PlatformInterface {
  VisionAnalyzerChannel() : super(token: _token);

  static final _token = Object();

  static VisionAnalyzerChannel? _instance;

  static VisionAnalyzerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(VisionAnalyzerChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  VisionAnalyzer create({
    List<VisionObjectType>? types,
    required Consumer<VisionAnalyzer$Result> consumer,
  });
}
