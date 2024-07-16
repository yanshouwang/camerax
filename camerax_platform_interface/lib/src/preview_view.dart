import 'package:flutter/widgets.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:logging/logging.dart';

import 'camera_controller.dart';
import 'preview_view_controller.dart';
import 'scale_type.dart';

class PreviewView extends StatefulWidget {
  final CameraController controller;
  final ScaleType scaleType;
  final Level? logLevel;

  const PreviewView({
    super.key,
    required this.controller,
    this.scaleType = ScaleType.fitCenter,
    this.logLevel,
  });

  @override
  State<PreviewView> createState() => _PreviewViewState();
}

class _PreviewViewState extends State<PreviewView>
    with TypeLogger, LoggerController {
  late final PreviewViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PreviewViewController();
    if (widget.logLevel == null) {
      return;
    }
    logLevel = widget.logLevel;
  }

  @override
  Widget build(BuildContext context) {
    return _controller.build(
      context,
      onCreated: (id) {
        logger.info('onCreated.');
        _controller.setController(widget.controller);
        _controller.setScaleType(widget.scaleType);
      },
    );
  }

  @override
  void didUpdateWidget(covariant PreviewView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.logLevel != oldWidget.logLevel) {
      logLevel = widget.logLevel;
    }
    if (widget.controller != oldWidget.controller) {
      logger.info('didUpdate ${widget.controller}.');
      _controller.setController(widget.controller);
    }
    if (widget.scaleType != oldWidget.scaleType) {
      logger.info('didUpdate ${widget.scaleType}.');
      _controller.setScaleType(widget.scaleType);
    }
  }
}
