import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ZoomSuggestionOptionsZoomCallbackImpl
    extends ZoomSuggestionOptions$ZoomCallback {
  final ZoomSuggestionOptionsZoomCallbackProxyApi api;

  ZoomSuggestionOptionsZoomCallbackImpl.internal(this.api) : super.impl();

  factory ZoomSuggestionOptionsZoomCallbackImpl({
    required bool Function(double zoomRatio) setZoom,
  }) {
    final api = ZoomSuggestionOptionsZoomCallbackProxyApi(
      setZoom: (_, e) => setZoom(e),
    );
    return ZoomSuggestionOptionsZoomCallbackImpl.internal(api);
  }
}

final class ZoomSuggestionOptionsImpl extends ZoomSuggestionOptions {
  final ZoomSuggestionOptionsProxyApi api;

  ZoomSuggestionOptionsImpl.internal(this.api) : super.impl();

  factory ZoomSuggestionOptionsImpl(
    ZoomSuggestionOptions$ZoomCallback zoomCallback, {
    double? maxSupportedZoomRatio,
  }) {
    final api = ZoomSuggestionOptionsProxyApi.build(
      zoomCallback: zoomCallback.api,
      maxSupportedZoomRatio: maxSupportedZoomRatio,
    );
    return ZoomSuggestionOptionsImpl.internal(api);
  }
}

extension ZoomSuggestionOptionsZoomCallbackX
    on ZoomSuggestionOptions$ZoomCallback {
  ZoomSuggestionOptionsZoomCallbackProxyApi get api {
    final impl = this;
    if (impl is! ZoomSuggestionOptionsZoomCallbackImpl) throw TypeError();
    return impl.api;
  }
}

extension ZoomSuggestionOptionsX on ZoomSuggestionOptions {
  ZoomSuggestionOptionsProxyApi get api {
    final impl = this;
    if (impl is! ZoomSuggestionOptionsImpl) throw TypeError();
    return impl.api;
  }
}
