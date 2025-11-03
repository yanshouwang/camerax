// import 'dart:ui' as ui;

// import 'package:camerax_ios/src/camerax.g.dart';
// import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// base mixin DetectorImpl<T> on Detector<T> {
//   List<AVMetadataObjectTypeApi> get typeApis;

//   @override
//   Future<void> close() => throw UnimplementedError();
// }

// extension PointFApiX on PointFApi {
//   Point<int> get impl {
//     final ratio = ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
//     final x = (this.x * ratio).round();
//     final y = (this.y * ratio).round();
//     return Point(x, y);
//   }
// }

// extension RectFApiX on RectFApi {
//   Rect<int> get impl {
//     final ratio = ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
//     final left = (this.left * ratio).round();
//     final top = (this.top * ratio).round();
//     final right = (this.right * ratio).round();
//     final bottom = (this.bottom * ratio).round();
//     return Rect(left, top, right, bottom);
//   }
// }
