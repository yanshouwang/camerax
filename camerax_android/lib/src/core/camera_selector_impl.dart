import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraSelectorImpl extends CameraSelector {
  static CameraSelectorImpl get front =>
      CameraSelectorImpl.internal(CameraSelectorProxyApi.front);
  static CameraSelectorImpl get back =>
      CameraSelectorImpl.internal(CameraSelectorProxyApi.back);
  static CameraSelectorImpl get external =>
      CameraSelectorImpl.internal(CameraSelectorProxyApi.external);

  final CameraSelectorProxyApi api;

  CameraSelectorImpl.internal(this.api) : super.impl();

  factory CameraSelectorImpl({CameraSelectorLensFacing? lensFacing}) {
    final api = CameraSelectorProxyApi.build(lensFacing: lensFacing?.api);
    return CameraSelectorImpl.internal(api);
  }
}

extension CameraSelectorLensFacingX on CameraSelectorLensFacing {
  CameraSelectorLensFacingApi get api =>
      CameraSelectorLensFacingApi.values[index];
}

extension CameraSelectorLensFacingApiX on CameraSelectorLensFacingApi {
  CameraSelectorLensFacing get impl => CameraSelectorLensFacing.values[index];
}

extension CameraSelectorApiX on CameraSelector {
  CameraSelectorProxyApi get api {
    final impl = this;
    if (impl is! CameraSelectorImpl) throw TypeError();
    return impl.api;
  }
}

extension CameraSelectorProxyApiX on CameraSelectorProxyApi {
  CameraSelector get impl => CameraSelectorImpl.internal(this);
}
