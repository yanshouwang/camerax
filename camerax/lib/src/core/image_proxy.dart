import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;
import 'package:meta/meta.dart';

final class ImageProxy {
  final $interface.ImageProxy _obj;

  ImageProxy._native(this._obj);

  @internal
  $interface.ImageProxy get obj => _obj;

  $interface.ImageFormat get format => _obj.format;
  int get width => _obj.width;
  int get height => _obj.height;
  $interface.ImageInfo get imageInfo => _obj.imageInfo;
  List<$interface.PlaneProxy> get planes => _obj.planes;

  Future<void> close() => _obj.close();
}

extension ImageProxyObj on $interface.ImageProxy {
  @internal
  ImageProxy get args {
    return ImageProxy._native(this);
  }
}
