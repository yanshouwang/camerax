// import 'package:camerax_android/src/jni.dart' as $native;
// import 'package:camerax_platform_interface/camerax_platform_interface.dart'
//     as $interface;

// extension ImageFormatArgs on $interface.ImageFormat {
//   $native.ImageFormat get obj {
//     switch (this) {
//       case $interface.ImageFormat.jpeg:
//         return $native.ImageFormat.JPEG!;
//       case $interface.ImageFormat.jpegR:
//         return $native.ImageFormat.JPEG_R!;
//       case $interface.ImageFormat.yuv420_888:
//         return $native.ImageFormat.YUV_420_888!;
//       case $interface.ImageFormat.rgba8888:
//         return $native.ImageFormat.RGBA_8888!;
//     }
//   }
// }

// extension ImageFormatObj on $native.ImageFormat {
//   $interface.ImageFormat get args {
//     if (this == $native.ImageFormat.JPEG) {
//       return $interface.ImageFormat.jpeg;
//     }
//     if (this == $native.ImageFormat.JPEG_R) {
//       return $interface.ImageFormat.jpegR;
//     }
//     if (this == $native.ImageFormat.YUV_420_888) {
//       return $interface.ImageFormat.yuv420_888;
//     }
//     if (this == $native.ImageFormat.RGBA_8888) {
//       return $interface.ImageFormat.rgba8888;
//     }
//     throw ArgumentError.value(this);
//   }
// }
