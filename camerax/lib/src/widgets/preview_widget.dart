import 'dart:io';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/widgets.dart';

class PreviewWidget extends StatefulWidget {
  final CameraController controller;

  /// Android only
  final bool tlhc;

  /// Android only
  final PreviewView$ImplementationMode implementationMode;

  /// Android only
  final PreviewView$ScaleType scaleType;

  /// Android only
  final Color screenFlashOverlayColor;

  const PreviewWidget({
    super.key,
    required this.controller,
    this.tlhc = false,
    this.implementationMode = PreviewView$ImplementationMode.performance,
    this.scaleType = PreviewView$ScaleType.fillCenter,
    this.screenFlashOverlayColor = const Color(0xffffffff),
  });

  @override
  State<PreviewWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {
  late PreviewView _view;

  @override
  void initState() {
    super.initState();
    _view = _createView();
  }

  @override
  Widget build(BuildContext context) {
    return _view.build(context, tlhc: widget.tlhc);
  }

  @override
  void didUpdateWidget(covariant PreviewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final isViewOutdate =
        widget.tlhc != oldWidget.tlhc ||
        widget.implementationMode != oldWidget.implementationMode;
    if (isViewOutdate && Platform.isAndroid) {
      // _view.setController(null);
      _view = _createView();
      return;
    }
    if (widget.controller != oldWidget.controller) {
      _view.setController(widget.controller);
    }
    if (widget.scaleType != oldWidget.scaleType) {
      _view.setScaleType(widget.scaleType);
    }
    if (widget.screenFlashOverlayColor != oldWidget.screenFlashOverlayColor) {
      _view.setScreenFlashOverlayColor(widget.screenFlashOverlayColor);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  PreviewView _createView() {
    final view = PreviewView();
    if (Platform.isAndroid) {
      view.setImplementationMode(widget.implementationMode);
      view.setScreenFlashOverlayColor(widget.screenFlashOverlayColor);
    }
    view.setScaleType(widget.scaleType);
    view.setController(widget.controller);
    return view;
  }
}
