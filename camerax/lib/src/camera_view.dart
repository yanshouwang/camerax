import 'package:camerax_core/camerax_core.dart' as core;
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';
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
    return core.CameraViewBuilder.instance.build(
      id: id,
      viewType: '${core.uri}/camera_view',
    );
  }

  void createOrSetArguments() async {
    await core.CameraViewPigeon.instance.createOrSetArguments(
      id,
      controllerId: widget.controller.id,
      scaleType: widget.scaleType.index,
    );
  }

  @override
  void dispose() {
    core.FinalizerPigeon.instance.finalize(id);
    super.dispose();
  }
}

extension on CameraController {
  String get id => hashCode.toString();
}

extension on _CameraViewState {
  String get id => hashCode.toString();
}
