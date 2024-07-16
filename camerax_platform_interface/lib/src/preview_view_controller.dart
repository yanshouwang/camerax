import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';
import 'camerax.dart';
import 'scale_type.dart';

abstract class PreviewViewController {
  Widget build(
    BuildContext context, {
    required PlatformViewCreatedCallback onCreated,
  });
  Future<void> setController(CameraController controller);
  Future<void> setScaleType(ScaleType scaleType);

  factory PreviewViewController() {
    return CameraXPlugin.instance.createPreviewViewController();
  }
}
