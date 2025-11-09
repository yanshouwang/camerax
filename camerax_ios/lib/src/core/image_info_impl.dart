import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// import 'flash_state_impl.dart';

final class ImageInfoImpl extends ImageInfo {
  final ImageInfoProxyApi api;

  ImageInfoImpl.internal(this.api) : super.impl();

  @override
  FlashState get flashState => throw UnimplementedError();
  //  api.flashState.impl;
  @override
  int get rotationDegrees => api.rotationDegrees;
  @override
  int get timestamp => api.timestamp;
}

extension ImageInfoProxyApiX on ImageInfoProxyApi {
  ImageInfo get impl => ImageInfoImpl.internal(this);
}
