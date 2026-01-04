import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class SurfaceImpl implements Surface {
  final SurfaceProxyApi api;

  SurfaceImpl.internal(this.api);
}

extension Surface$RotationX on Surface$Rotation {
  SurfaceRotationApi get api => SurfaceRotationApi.values[index];
}

extension SurfaceRotationApiX on SurfaceRotationApi {
  Surface$Rotation get impl => Surface$Rotation.values[index];
}

extension SurfaceProxyApiX on SurfaceProxyApi {
  Surface get impl => SurfaceImpl.internal(this);
}
