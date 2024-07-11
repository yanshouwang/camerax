import 'package:flutter/widgets.dart';

import 'camera_controller.dart';
import 'camerax.dart';
import 'scale_type.dart';

class PreviewView extends StatelessWidget {
  final CameraController controller;
  final ScaleType scaleType;

  const PreviewView({
    super.key,
    required this.controller,
    this.scaleType = ScaleType.fitCenter,
  });

  @override
  Widget build(BuildContext context) {
    return CameraXPlugin.instance.buildPreviewView(
      context,
      controller: controller,
      scaleType: scaleType,
    );
  }
}
