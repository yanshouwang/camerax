import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:camerax_platform_interface/src/common.dart';
import 'package:flutter/widgets.dart' hide View;

import 'camera_controller.dart';

enum PreviewViewScaleType {
  fillCenter,
  fillEnd,
  fillStart,
  fitCenter,
  fitEnd,
  fitStart,
}

abstract base class PreviewView extends View {
  PreviewView.impl() : super.impl();

  factory PreviewView() => CameraXPlugin.instance.$PreviewView();

  Future<void> setController(CameraController controller);
}

class PreviewWidget extends StatefulWidget {
  final CameraController controller;

  const PreviewWidget({super.key, required this.controller});

  @override
  State<PreviewWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {
  late final PreviewView _view;

  @override
  void initState() {
    super.initState();
    _view = PreviewView();
    _view.setController(widget.controller);
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
  }

  @override
  void dispose() {
    super.dispose();
  }
}
