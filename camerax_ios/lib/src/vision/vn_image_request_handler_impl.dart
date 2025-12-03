import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'vn_request_impl.dart';

final class VNImageRequestHandlerImpl extends VNImageRequestHandler {
  final VNImageRequestHandlerProxyApi api;

  VNImageRequestHandlerImpl.internal(this.api) : super.impl();

  factory VNImageRequestHandlerImpl.uri(Uri uri) {
    final api = VNImageRequestHandlerProxyApi.url(url: '$uri');
    return VNImageRequestHandlerImpl.internal(api);
  }

  @override
  Future<void> perform(List<VNRequest> requests) =>
      api.perform(requests.map((e) => e.api).toList());
}
