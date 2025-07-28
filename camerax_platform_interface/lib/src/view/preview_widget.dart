import 'package:flutter/widgets.dart';

import 'camera_controller.dart';
import 'preview_view.dart';

class PreviewWidget extends StatefulWidget {
  final CameraController controller;

  const PreviewWidget({
    super.key,
    required this.controller,
  });

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
