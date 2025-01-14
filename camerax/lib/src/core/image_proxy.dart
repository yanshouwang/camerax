import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;
import 'package:meta/meta.dart';

final class ImageProxy {
  final $base.ImageProxy _obj;

  ImageProxy._native(this._obj);

  @internal
  $base.ImageProxy get obj => _obj;

  $base.ImageFormat get format => _obj.format;
  int get width => _obj.width;
  int get height => _obj.height;
  $base.ImageInfo get imageInfo => _obj.imageInfo;
  List<$base.PlaneProxy> get planes => _obj.planes;

  Future<void> close() => _obj.close();
}

extension ImageProxyObj on $base.ImageProxy {
  @internal
  ImageProxy get args {
    return ImageProxy._native(this);
  }
}
