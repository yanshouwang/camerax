import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class ZoomSuggestionOptions {
  final $base.ZoomSuggestionOptions _obj;

  ZoomSuggestionOptions({
    required $base.ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) : _obj = $base.ZoomSuggestionOptions(
          zoomCallback: zoomCallback,
          maxSupportedZoomRatio: maxSupportedZoomRatio,
        );

  $base.ZoomSuggestionOptions get obj => _obj;
}
