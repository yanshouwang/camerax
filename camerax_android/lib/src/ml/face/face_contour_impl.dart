import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension FaceContourTypeApiX on FaceContourTypeApi {
  FaceContourType get impl => FaceContourType.values[index];
}

extension FaceContourApiX on FaceContourApi {
  FaceContour get impl =>
      FaceContour(type: type.impl, points: points.map((e) => e.impl).toList());
}
