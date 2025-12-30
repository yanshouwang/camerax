import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

extension Surface$RotationX on Surface$Rotation {
  SurfaceRotationApi get api => SurfaceRotationApi.values[index];
}

extension SurfaceRotationApiX on SurfaceRotationApi {
  Surface$Rotation get impl => Surface$Rotation.values[index];
}
