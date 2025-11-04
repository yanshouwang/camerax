import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class PointImpl extends PointApi {
  final PointProxyApi api;

  PointImpl.internal(this.api) : super.impl();

  factory PointImpl(int x, int y) {
    final api = PointProxyApi(x: x, y: y);
    return PointImpl.internal(api);
  }

  @override
  int get x => api.x;
  @override
  int get y => api.y;
}

final class PointFImpl extends PointFApi {
  final PointFProxyApi api;

  PointFImpl.internal(this.api) : super.impl();

  factory PointFImpl(double x, double y) {
    final api = PointFProxyApi(x: x, y: y);
    return PointFImpl.internal(api);
  }

  @override
  double get x => api.x;
  @override
  double get y => api.y;
}

extension PointProxyApiX on PointProxyApi {
  PointApi get impl => PointImpl(x, y);
}

extension PointFProxyApiX on PointFProxyApi {
  PointFApi get impl => PointFImpl(x, y);
}
