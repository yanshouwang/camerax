import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camera_controller.dart';

final _token = Object();

abstract interface class PreviewView {
  factory PreviewView() {
    final instance = CameraXPlugin.instance.newPreviewView();
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  Future<void> setController(CameraController controller);

  Widget build(BuildContext context);
}

abstract base class PreviewViewChannel extends PlatformInterface
    implements PreviewView {
  PreviewViewChannel.impl() : super(token: _token);
}
