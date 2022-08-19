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
  String get id => hashCode.toString();

  @override
  void initState() {
    super.initState();
    // TODO: Is this always completes before build?
    core.CameraViewPigeon.instance.create(
      id,
      arguments: core.CameraViewArguments(
        scaleType: core.ScaleType.valueOf(widget.scaleType.index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    core.CameraViewPigeon.instance.create(
      id,
      arguments: core.CameraViewArguments(
        scaleType: core.ScaleType.valueOf(widget.scaleType.index),
      ),
    );
    return core.CameraViewBuilder.instance.build(
      id: id,
      onCreated: widget.onCreated,
    );
  }

  @override
  void dispose() {
    core.CameraViewPigeon.instance.dispose(id);
    super.dispose();
  }
}
