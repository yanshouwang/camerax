import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class ZoomState extends $base.ZoomState {
  final $native.ZoomState obj;

  ZoomState.$native(this.obj) : super.impl();

  @override
  Future<double> getLinearZoom() async {
    final value = await obj.getLinearZoom();
    return value;
  }

  @override
  Future<double> getMaxZoomRatio() async {
    final value = await obj.getMaxZoomRatio();
    return value;
  }

  @override
  Future<double> getMinZoomRatio() async {
    final vlaue = await obj.getMinZoomRatio();
    return vlaue;
  }

  @override
  Future<double> getZoomRatio() async {
    final value = await obj.getZoomRatio();
    return value;
  }
}
