import 'dart:ui' as $ui;

import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension IntRectX on Rect<int> {
  RectProxyApi get api =>
      RectProxyApi(left: left, top: top, right: right, bottom: bottom);

  Rect<double> vision(Size<int>? imageSize) =>
      imageSize == null ? ui() : normalized(imageSize);

  Rect<double> ui() {
    final ratio = $ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
    final left = this.left / ratio;
    final top = this.top / ratio;
    final right = this.right / ratio;
    final bottom = this.bottom / ratio;
    return Rect(left, top, right, bottom);
  }

  Rect<double> normalized(Size<int> imageSize) {
    final width = imageSize.width;
    final height = imageSize.height;
    final left = this.left / width;
    final top = this.top / height;
    final right = this.right / width;
    final bottom = this.bottom / height;
    return Rect(left, top, right, bottom);
  }
}

extension RectProxyApiX on RectProxyApi {
  Rect<int> get impl => Rect(left, top, right, bottom);
}
