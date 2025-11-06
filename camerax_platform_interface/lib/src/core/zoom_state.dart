abstract base class ZoomState {
  ZoomState.impl({
    required this.minZoomRatio,
    required this.maxZoomRatio,
    required this.zoomRatio,
    required this.linearZoom,
  });

  final double minZoomRatio;
  final double maxZoomRatio;
  final double zoomRatio;
  final double linearZoom;
}
