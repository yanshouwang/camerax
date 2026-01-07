import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class CameraSelector$BuilderImpl implements CameraSelector$Builder {
  final CameraSelectorBuilderProxyApi api;

  CameraSelector$BuilderImpl.internal(this.api);

  @override
  Future<CameraSelector$Builder> addCameraFilter(CameraFilter cameraFilter) =>
      throw UnimplementedError();

  @override
  Future<CameraSelector$Builder> requireLensFacing(
    CameraSelector$LensFacing lensFacing,
  ) => api.requireLensFacing(lensFacing.api).then((e) => e.impl);

  @override
  Future<CameraSelector$Builder> setPhysicalCameraId(String physicalCameraId) =>
      throw UnimplementedError();

  @override
  Future<CameraSelector> build() => api.build().then((e) => e.impl);
}

final class CameraSelectorImpl implements CameraSelector {
  final CameraSelectorProxyApi api;

  CameraSelectorImpl.internal(this.api);

  @override
  Future<List<CameraInfo>> filter(List<CameraInfo> cameraInfos) =>
      throw UnimplementedError();

  @override
  Future<String?> getPhysicalCameraId() => throw UnimplementedError();
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
  CameraSelector$Builder createBuilder() {
    final api = CameraSelectorBuilderProxyApi();
    return CameraSelector$BuilderImpl.internal(api);
  }
}

extension CameraSelector$LensFacingX on CameraSelector$LensFacing {
  CameraSelectorLensFacingApi get api =>
      CameraSelectorLensFacingApi.values[index];
}

extension CameraSelectorLensFacingApiX on CameraSelectorLensFacingApi {
  CameraSelector$LensFacing get impl => CameraSelector$LensFacing.values[index];
}

extension CameraSelectorBuilderProxyApiX on CameraSelectorBuilderProxyApi {
  CameraSelector$Builder get impl => CameraSelector$BuilderImpl.internal(this);
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
