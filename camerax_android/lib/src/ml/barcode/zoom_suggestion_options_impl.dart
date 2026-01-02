import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ZoomSuggestionOptions$BuilderImpl
    implements ZoomSuggestionOptions$Builder {
  final ZoomSuggestionOptionsBuilderProxyApi api;

  ZoomSuggestionOptions$BuilderImpl.internal(this.api);

  @override
  Future<ZoomSuggestionOptions$Builder> setMaxSupportedZoomRatio(
    double maxSupportedZoomRatio,
  ) => api.setMaxSupportedZoomRatio(maxSupportedZoomRatio).then((e) => e.impl);

  @override
  Future<ZoomSuggestionOptions> build() => api.build().then((e) => e.impl);
}

final class ZoomSuggestionOptions$ZoomCallbackImpl
    implements ZoomSuggestionOptions$ZoomCallback {
  final ZoomSuggestionOptionsZoomCallbackProxyApi api;

  ZoomSuggestionOptions$ZoomCallbackImpl.internal(this.api);
}

final class ZoomSuggestionOptionsImpl implements ZoomSuggestionOptions {
  final ZoomSuggestionOptionsProxyApi api;

  ZoomSuggestionOptionsImpl.internal(this.api);
}

final class ZoomSuggestionOptionsChannelImpl
    extends ZoomSuggestionOptionsChannel {
  @override
  ZoomSuggestionOptions$Builder createBuilder(
    ZoomSuggestionOptions$ZoomCallback zoomCallback,
  ) {
    final api = ZoomSuggestionOptionsBuilderProxyApi(
      zoomCallback: zoomCallback.api,
    );
    return ZoomSuggestionOptions$BuilderImpl.internal(api);
  }

  @override
  ZoomSuggestionOptions$ZoomCallback createZoomCallback({
    required bool Function(double zoomRatio) setZoom,
  }) {
    final api = ZoomSuggestionOptionsZoomCallbackProxyApi(
      setZoom: (_, e) => setZoom(e),
    );
    return ZoomSuggestionOptions$ZoomCallbackImpl.internal(api);
  }
}

extension ZoomSuggestionOptionsBuilderProxyApiX
    on ZoomSuggestionOptionsBuilderProxyApi {
  ZoomSuggestionOptions$Builder get impl =>
      ZoomSuggestionOptions$BuilderImpl.internal(this);
}

extension ZoomSuggestionOptions$ZoomCallbackX
    on ZoomSuggestionOptions$ZoomCallback {
  ZoomSuggestionOptionsZoomCallbackProxyApi get api {
    final impl = this;
    if (impl is! ZoomSuggestionOptions$ZoomCallbackImpl) throw TypeError();
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

extension ZoomSuggestionOptionsProxyApiX on ZoomSuggestionOptionsProxyApi {
  ZoomSuggestionOptions get impl => ZoomSuggestionOptionsImpl.internal(this);
}
