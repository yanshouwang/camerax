import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin DetectorImpl<T> on Detector<T> {
  List<AVMetadataObjectTypeApi> get typeApis;

  @override
  Future<void> close() => throw UnimplementedError();
}

extension PointFApiX on PointFApi {
  Point<int> implOf(SizeApi sizeApi) {
    final x = this.x.round();
    final y = this.y.round();
    return Point(x, y);
  }
}

extension RectFApiX on RectFApi {
  Rect<int> implOf(SizeApi sizeApi) {
    final left = this.left.round();
    final top = this.top.round();
    final right = this.right.round();
    final bottom = this.bottom.round();
    return Rect(left, top, right, bottom);
  }
}
