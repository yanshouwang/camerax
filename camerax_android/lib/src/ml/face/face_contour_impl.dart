import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FaceContourImpl extends FaceContourApi {
  final FaceContourProxyApi api;

  FaceContourImpl.internal(this.api) : super.impl();

  @override
  List<PointFApi> get points => api.points.map((e) => e.impl).toList();
  @override
  FaceContourType get type => api.type.impl;
}

extension FaceContourTypeX on FaceContourType {
  FaceContourTypeApi get api => FaceContourTypeApi.values[index];
}

extension FaceContourTypeApiX on FaceContourTypeApi {
  FaceContourType get impl => FaceContourType.values[index];
}

extension FaceContourProxyApiX on FaceContourProxyApi {
  FaceContourApi get impl => FaceContourImpl.internal(this);
}
