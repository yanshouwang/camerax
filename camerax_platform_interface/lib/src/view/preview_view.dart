import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/view.dart';
import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum PreviewView$ImplementationMode { compatible, performance }

enum PreviewView$ScaleType {
  fillStart,
  fillCenter,
  fillEnd,
  fitStart,
  fitCenter,
  fitEnd,
}

abstract interface class PreviewView implements WidgetAdapter {
  factory PreviewView() => PreviewViewChannel.instance.create();

  Future<void> setController(CameraController? controller);
  Future<void> setImplementationMode(
    PreviewView$ImplementationMode implementationMode,
  );
  Future<void> setScaleType(PreviewView$ScaleType scaleType);
  Future<void> setScreenFlashOverlayColor(Color color);
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
