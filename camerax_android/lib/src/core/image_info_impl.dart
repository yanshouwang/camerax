import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ImageInfoImpl extends ImageInfo {
  final ImageInfoProxyApi api;

  ImageInfoImpl.internal(this.api) : super.impl();

  @override
  int get rotationDegrees => api.rotationDegrees;
  @override
  int get timestamp => api.timestamp;
}

extension ImageInfoProxyApiX on ImageInfoProxyApi {
  ImageInfo get impl => ImageInfoImpl.internal(this);
}
