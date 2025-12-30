import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera_info_impl.dart';

final class CameraSelectorImpl implements CameraSelector {
  final CameraSelectorProxyApi api;

  CameraSelectorImpl.internal(this.api);

  @override
  Future<List<CameraInfo>> filter(List<CameraInfo> cameraInfos) => api
      .filter(cameraInfos.map((e) => e.api).toList())
      .then((e) => e.map((e1) => e1.impl).toList());

  @override
  Future<String?> getPhysicalCameraId() => api.getPhysicalCameraId();
}

final class CameraSelectorChannelImpl extends CameraSelectorChannel {
  @override
  CameraSelector get back =>
      CameraSelectorImpl.internal(CameraSelectorProxyApi.back);
  @override
  CameraSelector get front =>
      CameraSelectorImpl.internal(CameraSelectorProxyApi.front);
  @override
  CameraSelector get external =>
      CameraSelectorImpl.internal(CameraSelectorProxyApi.external);

  @override
  CameraSelector create({CameraSelector$LensFacing? lensFacing}) {
    final api = CameraSelectorProxyApi.build(lensFacing: lensFacing?.api);
    return CameraSelectorImpl.internal(api);
  }
}

extension CameraSelectorLensFacingX on CameraSelector$LensFacing {
  CameraSelectorLensFacingApi get api =>
      CameraSelectorLensFacingApi.values[index];
}

extension CameraSelectorLensFacingApiX on CameraSelectorLensFacingApi {
  CameraSelector$LensFacing get impl => CameraSelector$LensFacing.values[index];
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
