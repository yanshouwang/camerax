import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

base mixin DetectorImpl<T> on Detector<T> {
  List<AVMetadataObjectTypeApi> get typeApis;

  @override
  Future<void> close() => throw UnimplementedError();
}

extension PointFApiX on PointFApi {
  Point<int> implOf(SizeApi sizeApi) {
    final x = (this.x * sizeApi.width).round();
    final y = (this.y * sizeApi.height).round();
    return Point(x, y);
  }
}

extension RectFApiX on RectFApi {
  Rect<int> implOf(SizeApi sizeApi) {
    final left = (this.left * sizeApi.width).round();
    final top = (this.top * sizeApi.height).round();
    final right = (this.right * sizeApi.width).round();
    final bottom = (this.bottom * sizeApi.height).round();
    return Rect(left, top, right, bottom);
  }
}
