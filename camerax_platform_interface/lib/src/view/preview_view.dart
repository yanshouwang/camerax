import 'package:flutter/widgets.dart';

import 'camera_controller.dart';
import 'preview_view_builder.dart';

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
    final builder = PreviewViewBuilder();
    return builder.build(controller);
  }
}
