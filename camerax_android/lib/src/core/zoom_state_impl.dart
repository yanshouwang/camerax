import 'package:camerax_android/src/jni.dart' as jni;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

class ZoomStateImpl implements ZoomState {
  final jni.ZoomState obj;

  ZoomStateImpl(this.obj);

  @override
  double get linearZoom => obj.getLinearZoom();

  @override
  double get maxZoomRatio => obj.getMaxZoomRatio();

  @override
  double get minZoomRatio => obj.getMinZoomRatio();

  @override
  double get zoomRatio => obj.getZoomRatio();
}
