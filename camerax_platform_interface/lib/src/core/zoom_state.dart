abstract base class ZoomState {
  ZoomState.impl();

  double get minZoomRatio;
  double get maxZoomRatio;
  double get zoomRatio;
  double get linearZoom;
}
