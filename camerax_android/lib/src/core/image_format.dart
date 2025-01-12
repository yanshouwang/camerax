import 'package:camerax_android/src/jni.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

extension ImageFormatArgs on $base.ImageFormat {
  $native.ImageFormat get obj {
    switch (this) {
      case $base.ImageFormat.jpeg:
        return $native.ImageFormat.JPEG!;
      case $base.ImageFormat.jpegR:
        return $native.ImageFormat.JPEG_R!;
      case $base.ImageFormat.yuv420_888:
        return $native.ImageFormat.YUV_420_888!;
      case $base.ImageFormat.rgba8888:
        return $native.ImageFormat.RGBA_8888!;
    }
  }
}

extension ImageFormatObj on $native.ImageFormat {
  $base.ImageFormat get args {
    if (this == $native.ImageFormat.JPEG) {
      return $base.ImageFormat.jpeg;
    }
    if (this == $native.ImageFormat.JPEG_R) {
      return $base.ImageFormat.jpegR;
    }
    if (this == $native.ImageFormat.YUV_420_888) {
      return $base.ImageFormat.yuv420_888;
    }
    if (this == $native.ImageFormat.RGBA_8888) {
      return $base.ImageFormat.rgba8888;
    }
    throw ArgumentError.value(this);
  }
}
