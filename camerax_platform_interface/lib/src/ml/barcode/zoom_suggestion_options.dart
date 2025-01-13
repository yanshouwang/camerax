import 'package:camerax_platform_interface/src/camerax.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

typedef ZoomCallback = bool Function(double zoomRatio);

abstract base class ZoomSuggestionOptions extends PlatformInterface {
  static final _token = Object();

  ZoomSuggestionOptions.impl() : super(token: _token);

  factory ZoomSuggestionOptions({
    required ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) =>
      CameraX.instance.createZoomSuggestionOptions(
        zoomCallback: zoomCallback,
        maxSupportedZoomRatio: maxSupportedZoomRatio,
      );
}
