import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraSelectorImpl extends CameraSelector {
  static CameraSelectorImpl get front =>
      CameraSelectorImpl.api(CameraSelectorApi.front);
  static CameraSelectorImpl get back =>
      CameraSelectorImpl.api(CameraSelectorApi.back);
  static CameraSelectorImpl get external =>
      CameraSelectorImpl.api(CameraSelectorApi.external);

  final CameraSelectorApi api;

  CameraSelectorImpl.internal(this.api) : super.impl();

  factory CameraSelectorImpl({CameraSelectorLensFacing? lensFacing}) {
    final api = CameraSelectorApi(lensFacing: lensFacing?.api);
    return CameraSelectorImpl.api(api);
  }

  @override
  int get hashCode => api.hashCode;

  @override
  bool operator ==(Object other) =>
      other is CameraSelectorImpl && api == other.api;
}

extension CameraSelectorLensFacingX on CameraSelectorLensFacing {
  CameraSelectorLensFacingApi get api =>
      CameraSelectorLensFacingApi.values[index];
}

extension CameraSelectorLensFacingApiX on CameraSelectorLensFacingApi {
  CameraSelectorLensFacing get impl => CameraSelectorLensFacing.values[index];
}

extension CameraSelectorApiX on CameraSelectorApi {
  CameraSelector get impl => CameraSelectorImpl.api(this);
}
