import 'package:flutter/widgets.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:logging/logging.dart';

import 'camera_controller.dart';
import 'camerax.dart';
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
  int? _id;

  @override
  void initState() {
    super.initState();
    if (widget.logLevel == null) {
      return;
    }
    logLevel = widget.logLevel;
  }

  @override
  Widget build(BuildContext context) {
    logger.info('build.');
    return CameraXPlugin.instance.buildPreviewView(
      context,
      controller: widget.controller,
      scaleType: widget.scaleType,
      onPreviewViewCreated: (id) {
        logger.info('onPreviewViewCreated.');
        _id = id;
        CameraXPlugin.instance.setPreviewViewController(id, widget.controller);
        CameraXPlugin.instance.setPreviewViewScaleType(id, widget.scaleType);
      },
    );
  }

  @override
  void didUpdateWidget(covariant PreviewView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.logLevel != oldWidget.logLevel) {
      logLevel = widget.logLevel;
    }
    final id = _id;
    if (id == null) {
      return;
    }
    if (widget.controller != oldWidget.controller) {
      logger.info('didUpdate ${widget.controller}.');
      CameraXPlugin.instance.setPreviewViewController(id, widget.controller);
    }
    if (widget.scaleType != oldWidget.scaleType) {
      logger.info('didUpdate ${widget.scaleType}.');
      CameraXPlugin.instance.setPreviewViewScaleType(id, widget.scaleType);
    }
  }
}
