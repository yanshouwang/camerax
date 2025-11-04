abstract base class ZoomStateApi {
  ZoomStateApi.impl();

  double get minZoomRatio;
  double get maxZoomRatio;
  double get zoomRatio;
  double get linearZoom;
}
