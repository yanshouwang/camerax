import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $interface;

extension ImageFormatArgs on $interface.ImageFormat {
  $native.ImageFormat get obj {
    switch (this) {
      case $interface.ImageFormat.jpeg:
        return $native.ImageFormat.jpeg;
      case $interface.ImageFormat.jpegR:
        return $native.ImageFormat.jpegR;
      case $interface.ImageFormat.yuv420_888:
        return $native.ImageFormat.yuv420_888;
      case $interface.ImageFormat.rgba8888:
        return $native.ImageFormat.rgba8888;
    }
  }
}

extension ImageFormatObj on $native.ImageFormat {
  $interface.ImageFormat get args {
    switch (this) {
      case $native.ImageFormat.jpeg:
        return $interface.ImageFormat.jpeg;
      case $native.ImageFormat.jpegR:
        return $interface.ImageFormat.jpegR;
      case $native.ImageFormat.yuv420_888:
        return $interface.ImageFormat.yuv420_888;
      case $native.ImageFormat.rgba8888:
        return $interface.ImageFormat.rgba8888;
    }
  }
}
