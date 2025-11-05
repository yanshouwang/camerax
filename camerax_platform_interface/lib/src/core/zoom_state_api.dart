abstract base class ZoomStateApi {
  ZoomStateApi.impl();

  Future<double> getLinearZoom();
  Future<double> getMaxZoomRatio();
  Future<double> getMinZoomRatio();
  Future<double> getZoomRatio();
}
