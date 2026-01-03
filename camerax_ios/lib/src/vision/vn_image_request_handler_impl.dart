import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/vision.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class VNImageRequestHandlerImpl implements VNImageRequestHandler {
  final VNImageRequestHandlerProxyApi api;

  VNImageRequestHandlerImpl.internal(this.api);

  @override
  Future<void> perform(List<VNRequest> requests) =>
      api.perform(requests.map((e) => e.api).toList());
}

final class VNImageRequestHandlerChannelImpl
    extends VNImageRequestHandlerChannel {
  @override
  VNImageRequestHandler createWithUri(Uri uri) {
    final api = VNImageRequestHandlerProxyApi.url(url: '$uri');
    return VNImageRequestHandlerImpl.internal(api);
  }
}
