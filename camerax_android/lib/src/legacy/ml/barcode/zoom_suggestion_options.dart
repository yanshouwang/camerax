import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class ZoomSuggestionOptions extends $base.ZoomSuggestionOptions {
  final $native.ZoomSuggestionOptions obj;

  ZoomSuggestionOptions.$native(this.obj) : super.impl();

  factory ZoomSuggestionOptions({
    required $base.ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) {
    final obj = $native.ZoomSuggestionOptions.build(
      zoomCallback: $native.ZoomCallback(
        setZoom: (obj, zoomRatio) => zoomCallback(zoomRatio),
      ),
      maxSupportedZoomRatio: maxSupportedZoomRatio,
    );
    return ZoomSuggestionOptions.$native(obj);
  }
}
