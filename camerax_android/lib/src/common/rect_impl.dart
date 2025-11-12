import 'dart:ui' as ui;

import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension IntRectX on Rect<int> {
  RectProxyApi get api =>
      RectProxyApi(left: left, top: top, right: right, bottom: bottom);
}

extension RectProxyApiX on RectProxyApi {
  Rect<int> get impl => Rect(left, top, right, bottom);

  Rect<double> get vimpl {
    final ratio = ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
    final left = this.left / ratio;
    final top = this.top / ratio;
    final right = this.right / ratio;
    final bottom = this.bottom / ratio;
    return Rect(left, top, right, bottom);
  }
}
