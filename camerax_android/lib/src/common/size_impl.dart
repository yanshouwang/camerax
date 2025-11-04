import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class SizeImpl extends SizeApi {
  final SizeProxyApi api;

  SizeImpl.internal(this.api) : super.impl();

  factory SizeImpl(int width, int height) {
    final api = SizeProxyApi(width: width, height: height);
    return SizeImpl.internal(api);
  }

  @override
  int get height => api.height;
  @override
  int get width => api.width;
}

extension SizeApiX on SizeApi {
  SizeProxyApi get api {
    final impl = this;
    if (impl is! SizeImpl) throw TypeError();
    return impl.api;
  }
}

extension SizeProxyApiX on SizeProxyApi {
  SizeApi get impl => SizeImpl(width, height);
}
