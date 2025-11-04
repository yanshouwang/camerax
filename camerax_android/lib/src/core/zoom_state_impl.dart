import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ZoomStateImpl extends ZoomStateApi {
  final ZoomStateProxyApi api;

  ZoomStateImpl.internal(this.api) : super.impl();

  @override
  double get linearZoom => api.linearZoom;
  @override
  double get maxZoomRatio => api.maxZoomRatio;
  @override
  double get minZoomRatio => api.minZoomRatio;
  @override
  double get zoomRatio => api.zoomRatio;
}

extension ZoomStateProxyApiX on ZoomStateProxyApi {
  ZoomStateApi get impl => ZoomStateImpl.internal(this);
}
