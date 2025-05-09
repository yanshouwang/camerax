import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

typedef ZoomCallback = bool Function(double zoomRatio);

final _token = Object();

abstract interface class ZoomSuggestionOptions {
  factory ZoomSuggestionOptions({
    required ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) {
    final instance = CameraXPlugin.instance.newZoomSuggestionOptions(
      zoomCallback: zoomCallback,
      maxSupportedZoomRatio: maxSupportedZoomRatio,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class ZoomSuggestionOptionsChannel extends PlatformInterface
    implements ZoomSuggestionOptions {
  ZoomSuggestionOptionsChannel.impl() : super(token: _token);
}
