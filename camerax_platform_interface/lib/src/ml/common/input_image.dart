import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class InputImage {
  factory InputImage.fromFilePath(Uri imageUri) =>
      InputImageChannel.instance.fromFilePath(imageUri);

  Future<int> getWidth();
  Future<int> getHeight();
}

abstract base class InputImageChannel extends PlatformInterface {
  InputImageChannel() : super(token: _token);

  static final _token = Object();

  static InputImageChannel? _instance;

  static InputImageChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(InputImageChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  InputImage fromFilePath(Uri imageUri);
}
