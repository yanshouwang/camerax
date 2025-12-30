import 'dart:io';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class VisionImage {
  factory VisionImage.uri(Uri uri) =>
      VisionImageChannel.instance.createWithUri(uri);

  factory VisionImage.file(File file) =>
      VisionImageChannel.instance.createWithFile(file);
}

abstract base class VisionImageChannel extends PlatformInterface {
  VisionImageChannel() : super(token: _token);

  static final _token = Object();

  static VisionImageChannel? _instance;

  static VisionImageChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(VisionImageChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  VisionImage createWithUri(Uri uri);
  VisionImage createWithFile(File file);
}
