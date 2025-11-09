import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ZoomStateImpl extends ZoomState {
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
  ZoomState get impl => ZoomStateImpl.internal(this);
}
