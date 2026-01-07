import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ZoomStateImpl implements ZoomState {
  final ZoomStateProxyApi api;

  ZoomStateImpl.internal(this.api);

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
