import 'package:camerax_android/src/jni.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class ZoomState extends $base.ZoomState {
  final $native.ZoomState obj;

  ZoomState.$native(this.obj) : super.impl();

  @override
  Future<double> getLinearZoom() async {
    return obj.getLinearZoom();
  }

  @override
  Future<double> getMaxZoomRatio() async {
    return obj.getMaxZoomRatio();
  }

  @override
  Future<double> getMinZoomRatio() async {
    return obj.getMinZoomRatio();
  }

  @override
  Future<double> getZoomRatio() async {
    return obj.getZoomRatio();
  }
}
