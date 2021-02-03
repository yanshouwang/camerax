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
        scale: controller.resolution.fill(MediaQuery.of(context).size),
        child: Center(
          child: AspectRatio(
            aspectRatio: controller.resolution.aspectRatio,
            child: controller.view,
          ),
        ),
      ),
    );
  }
}

extension on Size {
  double fill(Size targetSize) {
    if (targetSize.aspectRatio < aspectRatio) {
      return targetSize.height * aspectRatio / targetSize.width;
    } else {
      return targetSize.width / aspectRatio / targetSize.height;
    }
  }
}
