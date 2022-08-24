import 'package:camerax_core/camerax_core.dart' as core;
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';
import 'extensions.dart';
import 'scale_type.dart';

class CameraView extends StatefulWidget {
  final CameraController controller;
  final ScaleType scaleType;

  const CameraView({
    Key? key,
    required this.controller,
    this.scaleType = ScaleType.fillCenter,
  }) : super(key: key);

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    createOrSetArguments();
    return core.CameraView(id: id);
  }

  void createOrSetArguments() async {
    await core.CameraViewPigeon.instance.createOrSetArguments(
      id,
      arguments: core.CameraViewArguments(
        controllerId: widget.controller.id,
        scaleType: core.ScaleType.valueOf(widget.scaleType.index),
      ),
    );
  }

  @override
  void dispose() {
    core.FinalizerPigeon.instance.finalize(id);
    super.dispose();
  }
}
