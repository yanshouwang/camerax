import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

import 'image_format.dart';
import 'image_info.dart';
import 'plane_proxy.dart';

final class ImageProxy extends $interface.ImageProxy {
  final $native.ImageProxy obj;

  ImageProxy.$native(
    this.obj, {
    required super.format,
    required super.width,
    required super.height,
    required super.imageInfo,
    required super.planes,
  }) : super.impl();

  @override
  Future<void> close() async {
    await obj.close();
  }
}

extension ImageProxyObj on $native.ImageProxy {
  $interface.ImageProxy get args {
    return ImageProxy.$native(
      this,
      format: format.args,
      width: width,
      height: height,
      imageInfo: imageInfo.args,
      planes: planes.map((plane) => plane.args).toList(),
    );
  }
}
