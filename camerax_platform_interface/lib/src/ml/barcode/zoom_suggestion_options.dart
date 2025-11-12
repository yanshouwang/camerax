import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class ZoomSuggestionOptionsZoomCallback {
  ZoomSuggestionOptionsZoomCallback.impl();

  factory ZoomSuggestionOptionsZoomCallback({
    required bool Function(double zoomRatio) setZoom,
  }) => CameraXPlugin.instance.$ZoomSuggestionOptions$ZoomCallback(
    setZoom: setZoom,
  );
}

abstract base class ZoomSuggestionOptions {
  ZoomSuggestionOptions.impl();

  factory ZoomSuggestionOptions(
    ZoomSuggestionOptionsZoomCallback zoomCallback, {
    double? maxSupportedZoomRatio,
  }) => CameraXPlugin.instance.$ZoomSuggestionOptions(
    zoomCallback,
    maxSupportedZoomRatio: maxSupportedZoomRatio,
  );
}
