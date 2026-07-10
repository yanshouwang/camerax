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
  late final Observer<PreviewView$StreamState> _observer;
  late PreviewView _view;

  @override
  void initState() {
    super.initState();
    _observer = Observer(
      onChanged: (state) {
        switch (state) {
          case .idle:
            _view.setAlpha(0.0);
            break;
          case .streaming:
            _view.setAlpha(1.0);
            break;
        }
      },
    );
    _view = PreviewView();
    _initView();
  }

  @override
  Widget build(BuildContext context) {
    return _view.build(context, tlhc: widget.tlhc);
  }

  @override
  void didUpdateWidget(covariant PreviewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (Platform.isAndroid) {
      if (widget.tlhc != oldWidget.tlhc) {
        _deinitView();
        _view = PreviewView();
        _initView();
        _view.getPreviewStreamState().then((e) => e.observeForever(_observer));
        return;
      }
      if (widget.implementationMode != oldWidget.implementationMode) {
        _view.setController(null);
        _view.setImplementationMode(widget.implementationMode);
        _view.setController(oldWidget.controller);
      }
      if (widget.screenFlashOverlayColor != oldWidget.screenFlashOverlayColor) {
        _view.setScreenFlashOverlayColor(widget.screenFlashOverlayColor);
      }
    }
    if (widget.scaleType != oldWidget.scaleType) {
      _view.setScaleType(widget.scaleType);
    }
    if (widget.controller != oldWidget.controller) {
      _view.setController(widget.controller);
    }
  }

  @override
  void dispose() {
    _deinitView();
    super.dispose();
  }

  void _initView() {
    if (Platform.isAndroid) {
      _view.setImplementationMode(widget.implementationMode);
      _view.setScreenFlashOverlayColor(widget.screenFlashOverlayColor);
    }
    _view.setAlpha(0.0);
    _view.setScaleType(widget.scaleType);
    _view.setController(widget.controller);
    _view.getPreviewStreamState().then((e) => e.observeForever(_observer));
  }

  void _deinitView() {
    _view.getPreviewStreamState().then((e) => e.removeObserver(_observer));
  }
}
