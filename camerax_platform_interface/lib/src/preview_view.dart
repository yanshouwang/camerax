import 'package:flutter/widgets.dart';

import 'camera_controller.dart';
import 'camerax.dart';
import 'scale_type.dart';

abstract interface class PreviewView {
  Widget build(BuildContext context);

  Future<void> setController(CameraController controller);
  Future<void> setScaleType(ScaleType scaleType);
}

class PreviewWidget extends StatefulWidget {
  final CameraController controller;
  final ScaleType scaleType;

  const PreviewWidget({
    super.key,
    required this.controller,
    this.scaleType = ScaleType.fitCenter,
  });

  @override
  State<PreviewWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {
  late final PreviewView _view;

  @override
  void initState() {
    super.initState();
    _view = CameraXPlugin.instance.createPreviewView();
    _view.setController(widget.controller);
    _view.setScaleType(widget.scaleType);
  }

  @override
  Widget build(BuildContext context) {
    return _view.build(context);
  }

  @override
  void didUpdateWidget(covariant PreviewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _view.setController(widget.controller);
    }
    if (widget.scaleType != oldWidget.scaleType) {
      _view.setScaleType(widget.scaleType);
    }
  }
}
