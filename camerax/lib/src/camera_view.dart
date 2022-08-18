import 'package:camerax_core/camerax_core.dart' as core;
import 'package:flutter/widgets.dart';

import 'scale_type.dart';

typedef CameraViewCreatedCallback = core.CameraViewCreatedCallback;

class CameraView extends StatefulWidget {
  final ScaleType scaleType;
  final CameraViewCreatedCallback? onCreated;

  const CameraView({
    Key? key,
    this.scaleType = ScaleType.fillCenter,
    this.onCreated,
  }) : super(key: key);

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    return core.CameraViewBuilder.instance.build(
      arguments: core.CameraViewArguments(
        scaleType: core.ScaleType.valueOf(widget.scaleType.index),
      ),
      onCreated: widget.onCreated,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
