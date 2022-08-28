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
    core.CameraViewPigeon.instance.create(
      id,
      widget.controller.id,
      widget.scaleType.index,
    );
  }

  @override
  void didUpdateWidget(covariant CameraView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.scaleType != oldWidget.scaleType) {
      core.CameraViewPigeon.instance.setScaleType(id, widget.scaleType.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return core.CameraViewBuilder.instance.build(
      id: id,
      viewType: '${core.uri}/camera_view',
    );
  }

  @override
  void dispose() {
    core.FinalizerPigeon.instance.finalize(id);
    super.dispose();
  }
}
