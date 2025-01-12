import 'package:camerax_android/src/jni.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'image_format.dart';
import 'plane_proxy.dart';

final class ImageProxy extends $base.ImageProxy {
  final $native.ImageProxy obj;

  ImageProxy.$native(this.obj) : super.impl();

  @override
  Future<$base.ImageFormat> getFormat() async {
    return obj.getFormat().args;
  }

  @override
  Future<int> getWidth() async {
    return obj.getWidth();
  }

  @override
  Future<int> getHeight() async {
    return obj.getHeight();
  }

  @override
  Future<int> getRotationDegrees() async {
    return obj.getImageInfo().getRotationDegrees();
  }

  @override
  Future<List<$base.PlaneProxy>> getPlanes() async {
    final planeObjs = obj.getPlanes();
    final planes = <$base.PlaneProxy>[];
    for (var i = 0; i < planeObjs.length; i++) {
      final planeObj = planeObjs[i];
      final plane = MyPlaneProxy.$native(planeObj);
      planes.add(plane);
    }
    return planes;
  }

  @override
  Future<int> getTimestamp() async {
    return obj.getImageInfo().getTimestamp();
  }

  @override
  Future<void> close() async {
    obj.close();
  }
}
