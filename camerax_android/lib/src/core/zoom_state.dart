import 'package:camerax_android/src/jni.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

final class ZoomState extends $interface.ZoomState {
  final $native.ZoomState obj;

  ZoomState.$native(this.obj) : super.impl();

  @override
  double get linearZoom => obj.getLinearZoom();

  @override
  double get maxZoomRatio => obj.getMaxZoomRatio();

  @override
  double get minZoomRatio => obj.getMinZoomRatio();

  @override
  double get zoomRatio => obj.getZoomRatio();
}
