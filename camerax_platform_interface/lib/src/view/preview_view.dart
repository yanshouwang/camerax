import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';

class PreviewView extends StatelessWidget {
  final CameraController controller;
  final BoxFit fit;

  const PreviewView({
    super.key,
    required this.controller,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return CameraXPlugin.instance.buildPreviewView(
      controller: controller,
      fit: fit,
    );
  }
}
