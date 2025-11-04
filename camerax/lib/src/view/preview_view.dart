import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/widgets.dart';

import 'preview_view_api.dart';

class PreviewView extends StatefulWidget {
  final CameraControllerApi controller;

  const PreviewView({super.key, required this.controller});

  @override
  State<PreviewView> createState() => _PreviewViewState();
}

class _PreviewViewState extends State<PreviewView> {
  late final PreviewViewApi _api;

  @override
  void initState() {
    super.initState();
    _api = PreviewViewApi();
    _api.setController(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return _api.build(context);
  }

  @override
  void didUpdateWidget(covariant PreviewView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _api.setController(widget.controller);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
