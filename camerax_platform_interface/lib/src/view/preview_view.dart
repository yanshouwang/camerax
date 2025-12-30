import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/view.dart';
import 'package:flutter/widgets.dart' hide View;
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum PreviewView$ScaleType {
  fillCenter,
  fillEnd,
  fillStart,
  fitCenter,
  fitEnd,
  fitStart,
}

abstract interface class PreviewView implements View {
  factory PreviewView() => PreviewViewChannel.instance.create();

  Future<void> setController(CameraController controller);
}

abstract base class PreviewViewChannel extends PlatformInterface {
  PreviewViewChannel() : super(token: _token);

  static final _token = Object();

  static PreviewViewChannel? _instance;

  static PreviewViewChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(PreviewViewChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  PreviewView create();
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
