import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ZoomSuggestionOptionsZoomCallbackImpl
    extends ZoomSuggestionOptionsZoomCallback {
  final ZoomSuggestionOptionsZoomCallbackApi api;

  ZoomSuggestionOptionsZoomCallbackImpl.internal(this.api) : super.impl();

  factory ZoomSuggestionOptionsZoomCallbackImpl({
    required bool Function(double zoomRatio) setZoom,
  }) {
    final api = ZoomSuggestionOptionsZoomCallbackApi(
      setZoom: (_, e) => setZoom(e),
    );
    return ZoomSuggestionOptionsZoomCallbackImpl.internal(api);
  }
}

final class ZoomSuggestionOptionsImpl extends ZoomSuggestionOptions {
  final ZoomSuggestionOptionsApi api;

  ZoomSuggestionOptionsImpl.internal(this.api) : super.impl();

  factory ZoomSuggestionOptionsImpl(
    ZoomSuggestionOptionsZoomCallback zoomCallback, {
    double? maxSupportedZoomRatio,
  }) {
    final api = ZoomSuggestionOptionsApi.build(
      zoomCallback: zoomCallback.api,
      maxSupportedZoomRatio: maxSupportedZoomRatio,
    );
    return ZoomSuggestionOptionsImpl.internal(api);
  }
}

extension ZoomSuggestionOptionsZoomCallbackX
    on ZoomSuggestionOptionsZoomCallback {
  ZoomSuggestionOptionsZoomCallbackApi get api {
    final impl = this;
    if (impl is! ZoomSuggestionOptionsZoomCallbackImpl) throw TypeError();
    return impl.api;
  }
}

extension ZoomSuggestionOptionsX on ZoomSuggestionOptions {
  ZoomSuggestionOptionsApi get api {
    final impl = this;
    if (impl is! ZoomSuggestionOptionsImpl) throw TypeError();
    return impl.api;
  }
}
