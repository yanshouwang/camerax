import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ImageFormatX on ImageFormat {
  ImageFormatApi get api {
    switch (this) {
      case ImageFormat.jpeg:
        return ImageFormatApi.jpeg;
      case ImageFormat.jpegR:
        return ImageFormatApi.jpegR;
      case ImageFormat.yuv420_888:
        return ImageFormatApi.yuv420_888;
      case ImageFormat.rgba8888:
        return ImageFormatApi.rgba8888;
    }
  }
}

extension ImageFormatApiX on ImageFormatApi {
  ImageFormat get impl {
    switch (this) {
      case ImageFormatApi.jpeg:
        return ImageFormat.jpeg;
      case ImageFormatApi.jpegR:
        return ImageFormat.jpegR;
      case ImageFormatApi.yuv420_888:
        return ImageFormat.yuv420_888;
      case ImageFormatApi.rgba8888:
        return ImageFormat.rgba8888;
    }
  }
}
