import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ZoomStateApiX on ZoomStateApi {
  ZoomState get impl {
    return ZoomState(
      minZoomRatio: minZoomRatio,
      maxZoomRatio: maxZoomRatio,
      zoomRatio: zoomRatio,
      linearZoom: linearZoom,
    );
  }
}
