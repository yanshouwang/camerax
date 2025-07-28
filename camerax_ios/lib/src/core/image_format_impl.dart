import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension ImageFormatX on ImageFormat {
  ImageFormatApi get api {
    switch (this) {
      case ImageFormat.yuv420_888:
        return ImageFormatApi.yuv420_888;
      case ImageFormat.rgba8888:
        return ImageFormatApi.rgba8888;
      case ImageFormat.jpeg:
        return ImageFormatApi.jpeg;
    }
  }
}

extension ImageFormatApiX on ImageFormatApi {
  ImageFormat get impl {
    switch (this) {
      case ImageFormatApi.yuv420_888:
        return ImageFormat.yuv420_888;
      case ImageFormatApi.rgba8888:
        return ImageFormat.rgba8888;
      case ImageFormatApi.jpeg:
        return ImageFormat.jpeg;
    }
  }
}
