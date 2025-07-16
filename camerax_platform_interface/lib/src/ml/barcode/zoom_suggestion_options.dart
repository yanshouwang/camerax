import 'package:camerax_platform_interface/src/camerax_plugin.dart';

typedef ZoomCallback = bool Function(double zoomRatio);

abstract base class ZoomSuggestionOptions {
  ZoomSuggestionOptions.impl();

  factory ZoomSuggestionOptions({
    required ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) =>
      CameraXPlugin.instance.newZoomSuggestionOptions(
        zoomCallback: zoomCallback,
        maxSupportedZoomRatio: maxSupportedZoomRatio,
      );
}
