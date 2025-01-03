import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camera_controller.dart';

abstract base class PreviewView extends PlatformInterface {
  static final Object _token = Object();

  factory PreviewView() {
    final instance = CameraX.instance.createPreviewView();
    PlatformInterface.verify(instance, _token);
    return instance;
  }

  @protected
  PreviewView.impl() : super(token: _token);

  Future<void> setController(CameraController controller);

  Widget build(BuildContext context);
}
