import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';

abstract interface class PreviewViewBuilder {
  Widget build(CameraController controller);

  factory PreviewViewBuilder() {
    return CameraXPlugin.instance.createPreviewViewBuilder();
  }
}
