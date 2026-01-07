import 'package:camerax_platform_interface/src/vision.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class VNImageRequestHandler {
  factory VNImageRequestHandler.uri(Uri uri) =>
      VNImageRequestHandlerChannel.instance.createWithUri(uri);

  Future<void> perform(List<VNRequest> requests);
}

abstract base class VNImageRequestHandlerChannel extends PlatformInterface {
  VNImageRequestHandlerChannel() : super(token: _token);

  static final _token = Object();

  static VNImageRequestHandlerChannel? _instance;

  static VNImageRequestHandlerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(VNImageRequestHandlerChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  VNImageRequestHandler createWithUri(Uri uri);
}
