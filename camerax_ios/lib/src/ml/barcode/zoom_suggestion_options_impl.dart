import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ZoomSuggestionOptionsImpl extends ZoomSuggestionOptionsChannel {
  final ZoomSuggestionOptionsApi api;

  ZoomSuggestionOptionsImpl.impl(this.api) : super.impl();

  factory ZoomSuggestionOptionsImpl({
    required ZoomCallback zoomCallback,
    double? maxSupportedZoomRatio,
  }) {
    final api = ZoomSuggestionOptionsApi.build(
      zoomCallback: ZoomCallbackApi(
        setZoom: (_, zoomRatio) => zoomCallback(zoomRatio),
      ),
      maxSupportedZoomRatio: maxSupportedZoomRatio,
    );
    return ZoomSuggestionOptionsImpl.impl(api);
  }
}
