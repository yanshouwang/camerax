import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class ZoomState extends $interface.ZoomState {
  @override
  final double minZoomRatio;
  @override
  final double maxZoomRatio;
  @override
  final double zoomRatio;
  @override
  final double linearZoom;

  ZoomState({
    required this.minZoomRatio,
    required this.maxZoomRatio,
    required this.zoomRatio,
    required this.linearZoom,
  }) : super.impl();
}
