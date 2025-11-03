import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraSelectorImpl extends CameraSelector {
  static CameraSelectorImpl get front =>
      CameraSelectorImpl.internal(CameraSelectorApi.front);
  static CameraSelectorImpl get back =>
      CameraSelectorImpl.internal(CameraSelectorApi.back);
  static CameraSelectorImpl get external =>
      CameraSelectorImpl.internal(CameraSelectorApi.external);

  final CameraSelectorApi api;

  CameraSelectorImpl.internal(this.api) : super.impl();

  factory CameraSelectorImpl({CameraSelectorLensFacing? lensFacing}) {
    final api = CameraSelectorApi.build(lensFacing: lensFacing?.api);
    return CameraSelectorImpl.internal(api);
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

extension CameraSelectorX on CameraSelector {
  CameraSelectorApi get api {
    final impl = this;
    if (impl is! CameraSelectorImpl) throw TypeError();
    return impl.api;
  }
}

extension CameraSelectorApiX on CameraSelectorApi {
  CameraSelector get impl => CameraSelectorImpl.internal(this);
}
