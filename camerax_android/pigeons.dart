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

@HostApi(dartHostTestHandler: 'TestCameraViewHostPigeon')
abstract class CameraViewHostPigeon {
  void create(String id, Uint8List argumentsByteArray);
  void dispose(String id);
}
