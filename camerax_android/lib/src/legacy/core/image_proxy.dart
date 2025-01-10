import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_android/src/legacy/core/image_format.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

import 'plane_proxy.dart';

final class ImageProxy extends $base.ImageProxy {
  final $native.ImageProxy obj;

  ImageProxy.$native(this.obj) : super.impl();

  @override
  Future<void> close() async {
    await obj.close();
  }

  @override
  Future<$base.ImageFormat> getFormat() async {
    final obj = await this.obj.getFormat();
    return obj.args;
  }

  @override
  Future<int> getHeight() async {
    final value = await obj.getHieght();
    return value;
  }

  @override
  Future<List<$base.PlaneProxy>> getPlanes() async {
    final objs = await obj.getPlanes();
    return objs.map((obj) => PlaneProxy.$native(obj)).toList();
  }

  @override
  Future<int> getRotationDegrees() async {
    final imageInfoObj = await obj.getImageInfo();
    final value = await imageInfoObj.getRotationDegrees();
    return value;
  }

  @override
  Future<int> getTimestamp() async {
    final imageInfoObj = await obj.getImageInfo();
    final value = await imageInfoObj.getTimestamp();
    return value;
  }

  @override
  Future<int> getWidth() async {
    final value = await obj.getWidth();
    return value;
  }
}
