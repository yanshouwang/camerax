import 'package:camerax_platform_interface/src/visionx.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class VisionDetector {
  factory VisionDetector({List<VisionObjectType>? types}) =>
      VisionDetectorChannel.instance.create(types: types);

  Future<List<VisionObject>> detect(VisionImage image);
}

abstract base class VisionDetectorChannel extends PlatformInterface {
  VisionDetectorChannel() : super(token: _token);

  static final _token = Object();

  static VisionDetectorChannel? _instance;

  static VisionDetectorChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(VisionDetectorChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  VisionDetector create({List<VisionObjectType>? types});
}
