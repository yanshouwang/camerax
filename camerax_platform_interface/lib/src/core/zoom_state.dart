final class ZoomState {
  final double minZoomRatio;
  final double maxZoomRatio;
  final double zoomRatio;
  final double linearZoom;

  ZoomState({
    required this.minZoomRatio,
    required this.maxZoomRatio,
    required this.zoomRatio,
    required this.linearZoom,
  });

  @override
  int get hashCode =>
      Object.hash(minZoomRatio, maxZoomRatio, zoomRatio, linearZoom);

  @override
  bool operator ==(Object other) {
    return other is ZoomState &&
        other.minZoomRatio == minZoomRatio &&
        other.maxZoomRatio == maxZoomRatio &&
        other.zoomRatio == zoomRatio &&
        other.linearZoom == linearZoom;
  }
}
