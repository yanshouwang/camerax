import 'package:camerax_android/src/jni.dart' as jni;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:jni/jni.dart';

import 'plane_proxy.dart';

final class MyImageProxy implements ImageProxy {
  final jni.ImageProxy jniValue;

  MyImageProxy.jni(this.jniValue);

  @override
  ImageFormat get format => jniValue.getFormat().dartImageFormat;

  @override
  int get width => jniValue.getWidth();

  @override
  int get height => jniValue.getHeight();

  @override
  int get rotationDegrees => jniValue.getImageInfo().getRotationDegrees();

  @override
  List<PlaneProxy> get planeProxies {
    final jniPlaneProxies = jniValue.getPlanes();
    final planeProxies = <PlaneProxy>[];
    for (var i = 0; i < jniPlaneProxies.length; i++) {
      final jniPlaneProxy = jniPlaneProxies[i];
      final planeProxy = MyPlaneProxy.jni(jniPlaneProxy);
      planeProxies.add(planeProxy);
    }
    return planeProxies;
  }

  @override
  int get timestamp => jniValue.getImageInfo().getTimestamp();

  @override
  void close() {
    jniValue.close();
    jniValue.release();
  }
}
