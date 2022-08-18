import 'package:pigeon/pigeon.dart';

@HostApi(dartHostTestHandler: 'TestCameraProviderHostPigeon')
abstract class CameraProviderHostPigeon {
  @async
  Uint8List bind(
    Uint8List cameraSelectorByteArray,
    List<Uint8List> useCaseByteArrays,
  );
  @async
  void unbind(List<Uint8List> useCaseByteArrays);
  @async
  void unbindAll();
}
