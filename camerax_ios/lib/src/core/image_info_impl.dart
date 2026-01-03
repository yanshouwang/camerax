import 'package:camerax_ios/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class ImageInfoImpl implements ImageInfo {
  final ImageInfoProxyApi api;

  ImageInfoImpl.internal(this.api);

  @override
  FlashState get flashState => throw UnimplementedError();
  @override
  int get rotationDegrees => api.rotationDegrees;
  @override
  int get timestamp => api.timestamp;
}

extension ImageInfoProxyApiX on ImageInfoProxyApi {
  ImageInfo get impl => ImageInfoImpl.internal(this);
}
