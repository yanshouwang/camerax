import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class ZoomSuggestionOptionsZoomCallbackApi {
  ZoomSuggestionOptionsZoomCallbackApi.impl();

  factory ZoomSuggestionOptionsZoomCallbackApi({
    required bool Function(double zoomRatio) setZoom,
  }) => CameraXPlugin.instance.$ZoomSuggestionOptionsZoomCallbackApi(
    setZoom: setZoom,
  );
}

abstract base class ZoomSuggestionOptionsApi {
  ZoomSuggestionOptionsApi.impl();

  factory ZoomSuggestionOptionsApi(
    ZoomSuggestionOptionsZoomCallbackApi zoomCallback, {
    double? maxSupportedZoomRatio,
  }) => CameraXPlugin.instance.$ZoomSuggestionOptionsApi(
    zoomCallback,
    maxSupportedZoomRatio: maxSupportedZoomRatio,
  );
}
