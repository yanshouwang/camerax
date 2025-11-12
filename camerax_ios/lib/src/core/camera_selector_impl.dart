import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// import 'camera_info_impl.dart';

final class CameraSelectorImpl extends CameraSelector {
  static CameraSelectorImpl get back =>
      CameraSelectorImpl.internal(CameraSelectorProxyApi.back);
  static CameraSelectorImpl get front =>
      CameraSelectorImpl.internal(CameraSelectorProxyApi.front);
  static CameraSelectorImpl get external =>
      CameraSelectorImpl.internal(CameraSelectorProxyApi.external);

  final CameraSelectorProxyApi api;

  CameraSelectorImpl.internal(this.api) : super.impl();

  factory CameraSelectorImpl({CameraSelectorLensFacing? lensFacing}) {
    final api = CameraSelectorProxyApi.build(lensFacing: lensFacing?.api);
    return CameraSelectorImpl.internal(api);
  }

  @override
  Future<List<CameraInfo>> filter(List<CameraInfo> cameraInfos) =>
      throw UnimplementedError();
  // api
  //     .filter(cameraInfos.map((e) => e.api).toList())
  //     .then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<String?> getPhysicalCameraId() => throw UnimplementedError();
  //  api.getPhysicalCameraId();
}

extension CameraSelectorLensFacingX on CameraSelectorLensFacing {
  CameraSelectorLensFacingApi get api =>
      CameraSelectorLensFacingApi.values[index];
}

extension CameraSelectorLensFacingApiX on CameraSelectorLensFacingApi {
  CameraSelectorLensFacing get impl => CameraSelectorLensFacing.values[index];
}

extension CameraSelectorX on CameraSelector {
  CameraSelectorProxyApi get api {
    final impl = this;
    if (impl is! CameraSelectorImpl) throw TypeError();
    return impl.api;
  }
}

extension CameraSelectorProxyApiX on CameraSelectorProxyApi {
  CameraSelector get impl => CameraSelectorImpl.internal(this);
}
