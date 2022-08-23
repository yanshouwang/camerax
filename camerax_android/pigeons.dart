import 'package:pigeon/pigeon.dart';

@HostApi(dartHostTestHandler: 'TestFinalizerHostPigeon')
abstract class FinalizerHostPigeon {
  void finalize(String id);
}

@HostApi(dartHostTestHandler: 'TestCameraControllerHostPigeon')
abstract class CameraControllerHostPigeon {
  void create(String id, Uint8List cameraSelectorBuffer);
  void bind(String id);
  void enableTorch(String id, bool state);
  void setCameraSelector(String id, Uint8List cameraSelectorBuffer);
  void setImageAnalyzer(String id, String imageAnalyzerId);
  void clearImageAnalyzer(String id);
  void unbind(String id);
  void dispose(String id);
}

@FlutterApi()
abstract class CameraControllerFlutterPigeion {
  void onTorchStateChanged(String id, bool state);
}

@HostApi(dartHostTestHandler: 'TestImageAnalyzerHostPigeon')
abstract class ImageAnalyzerHostPigeon {
  void create(String id);
}

@FlutterApi()
abstract class ImageAnalyzerFutterPigeon {
  void onAnalyzed(String id, Uint8List imageProxyBuffer);
}

@HostApi(dartHostTestHandler: 'TestMLAnalyzerHostPigeon')
abstract class MLAnalyzerHostPigeon {
  void create(String id);
}

@FlutterApi()
abstract class MLAnalyzerFlutterPigeon {
  void onAnalyzed(String id, List<Uint8List> recognitionBuffer);
}

@HostApi(dartHostTestHandler: 'TestCameraViewHostPigeon')
abstract class CameraViewHostPigeon {
  void createOrSetArguments(String id, String controllerId, int scaleType);
}
