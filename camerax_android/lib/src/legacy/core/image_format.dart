import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension ImageFormatArgs on $base.ImageFormat {
  $native.ImageFormat get obj {
    switch (this) {
      case $base.ImageFormat.jpeg:
        return $native.ImageFormat.jpeg;
      case $base.ImageFormat.jpegR:
        return $native.ImageFormat.jpegR;
      case $base.ImageFormat.yuv420_888:
        return $native.ImageFormat.yuv420_888;
      case $base.ImageFormat.rgba8888:
        return $native.ImageFormat.rgba8888;
    }
  }
}

extension ImageFormatObj on $native.ImageFormat {
  $base.ImageFormat get args {
    switch (this) {
      case $native.ImageFormat.jpeg:
        return $base.ImageFormat.jpeg;
      case $native.ImageFormat.jpegR:
        return $base.ImageFormat.jpegR;
      case $native.ImageFormat.yuv420_888:
        return $base.ImageFormat.yuv420_888;
      case $native.ImageFormat.rgba8888:
        return $base.ImageFormat.rgba8888;
    }
  }
}
