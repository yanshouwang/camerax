import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class ZoomSuggestionOptions {
  final $interface.ZoomSuggestionOptions _obj;

  ZoomSuggestionOptions({
    required $interface.ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) : _obj = $interface.ZoomSuggestionOptions(
          zoomCallback: zoomCallback,
          maxSupportedZoomRatio: maxSupportedZoomRatio,
        );

  $interface.ZoomSuggestionOptions get obj => _obj;
}
