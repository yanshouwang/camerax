import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:flutter/widgets.dart';

import 'camera_controller.dart';

class PreviewView extends StatefulWidget {
  final CameraController controller;

  const PreviewView({
    super.key,
    required this.controller,
  });

  @override
  State<PreviewView> createState() => _PreviewViewState();
}

class _PreviewViewState extends State<PreviewView> {
  late final $interface.PreviewView _obj;

  @override
  void initState() {
    super.initState();
    _obj = $interface.PreviewView();
    _obj.setController(widget.controller.obj);
  }

  @override
  Widget build(BuildContext context) {
    return _obj.build(context);
  }

  @override
  void didUpdateWidget(covariant PreviewView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _obj.setController(widget.controller.obj);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
