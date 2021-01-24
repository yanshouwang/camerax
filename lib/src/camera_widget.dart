import 'package:flutter/material.dart';

import 'camera_controller.dart';

/// A widget showing a live camera preview.
class CameraWidget extends StatelessWidget {
  /// The controller of the camera.
  final CameraController controller;

  /// Create a [CameraWidget] with a [controller], the [controller] must has been initialized.
  CameraWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Transform.scale(
        scale: MediaQuery.of(context).scale(controller),
        child: Center(
          child: AspectRatio(
            aspectRatio: controller.aspectRatio,
            child: controller.view,
          ),
        ),
      ),
    );
  }
}

extension on MediaQueryData {
  double scale(CameraController controller) {
    final logicalWidth = size.width;
    final logicalHeight = controller.aspectRatio * logicalWidth;
    final height = size.height;
    return height / logicalHeight;
  }
}

extension on CameraController {
  double get aspectRatio => resolution.width / resolution.height;
}
