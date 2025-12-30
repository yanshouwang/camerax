import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FaceLandmarkImpl extends FaceLandmark {
  final FaceLandmarkProxyApi api;

  FaceLandmarkImpl.internal(this.api) : super.impl();

  @override
  Point<double> get position => api.position.impl;
  @override
  FaceLandmark$Type get type => api.type.impl;
}

extension FaceLandmarkTypeX on FaceLandmark$Type {
  FaceLandmarkTypeApi get api => FaceLandmarkTypeApi.values[index];
}

extension FaceLandmarkTypeApiX on FaceLandmarkTypeApi {
  FaceLandmark$Type get impl => FaceLandmark$Type.values[index];
}

extension FaceLandmarkProxyApiX on FaceLandmarkProxyApi {
  FaceLandmark get impl => FaceLandmarkImpl.internal(this);
}
