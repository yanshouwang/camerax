import 'dart:ui' as ui;

import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension PointProxyApiX on PointProxyApi {
  Point<int> get impl => Point(x, y);

  Point<double> get vimpl {
    final ratio = ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
    final x = this.x / ratio;
    final y = this.y / ratio;
    return Point(x, y);
  }
}

extension PointFProxyApiX on PointFProxyApi {
  Point<double> get impl => Point(x, y);
}
