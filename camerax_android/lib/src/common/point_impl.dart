import 'dart:ui' as $ui;

import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension IntPointX on Point<int> {
  Point<double> vision(Size<int>? imageSize) =>
      imageSize == null ? ui() : normalized(imageSize);

  Point<double> ui() {
    final ratio = $ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
    final x = this.x / ratio;
    final y = this.y / ratio;
    return Point(x, y);
  }

  Point<double> normalized(Size<int> imageSize) {
    final x = this.x / imageSize.width;
    final y = this.y / imageSize.height;
    return Point(x, y);
  }
}

extension PointProxyApiX on PointProxyApi {
  Point<int> get impl => Point(x, y);
}

extension PointFProxyApiX on PointFProxyApi {
  Point<double> get impl => Point(x, y);
}
