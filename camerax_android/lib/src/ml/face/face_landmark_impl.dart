import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FaceLandmarkImpl extends FaceLandmarkApi {
  final FaceLandmarkProxyApi api;

  FaceLandmarkImpl.internal(this.api) : super.impl();

  @override
  PointFApi get position => api.position.impl;
  @override
  FaceLandmarkType get type => api.type.impl;
}

extension FaceLandmarkTypeX on FaceLandmarkType {
  FaceLandmarkTypeApi get api => FaceLandmarkTypeApi.values[index];
}

extension FaceLandmarkTypeApiX on FaceLandmarkTypeApi {
  FaceLandmarkType get impl => FaceLandmarkType.values[index];
}

extension FaceLandmarkProxyApiX on FaceLandmarkProxyApi {
  FaceLandmarkApi get impl => FaceLandmarkImpl.internal(this);
}
