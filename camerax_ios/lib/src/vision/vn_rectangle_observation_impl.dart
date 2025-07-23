import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_ios/src/common/point_impl.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin VNRectangleObservationMixin on VNRectangleObservation {
  VNRectangleObservationApi get api;

  @override
  Future<Point<int>> getBottomLeft() => api.getBottomLeft().then((e) => e.impl);
  @override
  Future<Point<int>> getBottomRight() =>
      api.getBottomRight().then((e) => e.impl);
  @override
  Future<Point<int>> getTopLeft() => api.getTopLeft().then((e) => e.impl);
  @override
  Future<Point<int>> getTopRight() => api.getTopRight().then((e) => e.impl);
}
