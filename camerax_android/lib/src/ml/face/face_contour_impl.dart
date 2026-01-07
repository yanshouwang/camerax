import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FaceContourImpl implements FaceContour {
  final FaceContourProxyApi api;

  FaceContourImpl.internal(this.api);

  @override
  List<Point<double>> get points => api.points.map((e) => e.impl).toList();
  @override
  FaceContour$Type get type => api.type.impl;
}

extension FaceContour$TypeX on FaceContour$Type {
  FaceContourTypeApi get api => FaceContourTypeApi.values[index];
}

extension FaceContourTypeApiX on FaceContourTypeApi {
  FaceContour$Type get impl => FaceContour$Type.values[index];
}

extension FaceContourProxyApiX on FaceContourProxyApi {
  FaceContour get impl => FaceContourImpl.internal(this);
}
