import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';

enum PreviewViewScaleType {
  fillCenter,
  fillEnd,
  fillStart,
  fitCenter,
  fitEnd,
  fitStart,
}

abstract base class PreviewView {
  PreviewView.impl();

  factory PreviewView() => CameraXPlugin.instance.newPreviewView();

  Future<void> setController(CameraController controller);
  Widget build(BuildContext context);
}
