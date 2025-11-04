import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class RectImpl extends RectApi {
  final RectProxyApi api;

  RectImpl.internal(this.api) : super.impl();

  factory RectImpl(int left, int top, int right, int bottom) {
    final api = RectProxyApi(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
    return RectImpl.internal(api);
  }

  @override
  int get bottom => api.bottom;
  @override
  int get left => api.left;
  @override
  int get right => api.right;
  @override
  int get top => api.top;
}

extension RectProxyApiX on RectProxyApi {
  RectApi get impl => RectImpl(left, top, right, bottom);
}
