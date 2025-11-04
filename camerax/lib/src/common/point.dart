import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class Point<T extends num> {
  Point.impl();

  T get x;
  T get y;

  factory Point(T x, T y) {
    if (T == int) return PointImpl(x as int, y as int) as Point<T>;
    if (T == double) return PointFImpl(x as double, y as double) as Point<T>;
    throw TypeError();
  }
}

final class PointImpl extends Point<int> {
  final PointApi api;

  PointImpl.internal(this.api) : super.impl();

  factory PointImpl(int x, int y) {
    final api = PointApi(x, y);
    return PointImpl.internal(api);
  }

  @override
  int get x => api.x;

  @override
  int get y => api.y;
}

final class PointFImpl extends Point<double> {
  final PointApi api;

  PointFImpl.internal(this.api) : super.impl();

  factory PointFImpl(double x, double y) {
    final api = PointApi(x, y);
    return PointImpl.internal(api);
  }

  @override
  double get x => api.x;

  @override
  double get y => api.y;
}
