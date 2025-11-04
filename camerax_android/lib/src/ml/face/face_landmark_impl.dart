import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension FaceLandmarkTypeApiX on FaceLandmarkTypeApi {
  FaceLandmarkType get impl => FaceLandmarkType.values[index];
}

extension FaceLandmarkApiX on FaceLandmarkApi {
  FaceLandmarkApi get impl =>
      FaceLandmarkApi(type: type.impl, position: position.impl);
}
