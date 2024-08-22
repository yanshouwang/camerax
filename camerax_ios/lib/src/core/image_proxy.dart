import 'package:camerax_ios/src/ffi.dart' as ffi;
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'plane_proxy.dart';

final class MyImageProxy implements ImageProxy {
  final ffi.ImageProxy ffiValue;

  MyImageProxy.ffi(this.ffiValue);

  @override
  ImageFormat get format => ffiValue.format.dartValue;

  @override
  int get width => ffiValue.width;

  @override
  int get height => ffiValue.height;

  @override
  int get rotationDegrees => ffiValue.rotationDegrees;

  @override
  List<PlaneProxy> get planeProxies {
    final planeProxies = <PlaneProxy>[];
    final ffiPlaneProxies = ffiValue.planeProxies;
    for (var i = 0; i < ffiPlaneProxies.count; i++) {
      final ffiPlaneProxyObject = ffiPlaneProxies.objectAtIndex_(i);
      final ffiPlaneProxy = ffi.PlaneProxy.castFrom(ffiPlaneProxyObject);
      final planeProxy = MyPlaneProxy.ffi(ffiPlaneProxy);
      planeProxies.add(planeProxy);
    }
    return planeProxies;
  }

  @override
  int get timestamp => ffiValue.timestamp;

  @override
  void close() {
    ffiValue.close();
    ffiValue.release();
  }
}
