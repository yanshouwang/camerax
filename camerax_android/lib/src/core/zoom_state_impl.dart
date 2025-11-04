import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ZoomStateApiX on ZoomStateApi {
  ZoomStateApi get impl => ZoomStateApi(
    minZoomRatio: minZoomRatio,
    maxZoomRatio: maxZoomRatio,
    zoomRatio: zoomRatio,
    linearZoom: linearZoom,
  );
}
