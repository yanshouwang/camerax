import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/pigeon/messages.g.dart',
    dartTestOut: 'test/pigeon/test_messages.g.dart',
    javaOut:
        'android/src/main/java/dev/yanshouwang/camerax/pigeon/Messages.java',
    javaOptions: JavaOptions(
      package: 'dev.yanshouwang.camerax.pigeon',
    ),
    objcHeaderOut: 'ios/Classes/pigeon/Messages.h',
    objcSourceOut: 'ios/Classes/pigeon/Messages.m',
    objcOptions: ObjcOptions(
      header: 'ios/Classes/pigeon/Messages.h',
      prefix: 'Pigeon',
    ),
  ),
)
@HostApi(dartHostTestHandler: 'TestCameraViewHostApi')
abstract class CameraViewHostApi {
  void allocate(int id, int controllerId, int scaleTypeNumber);
  void free(int id);
  void setScaleType(int id, int scaleTypeNumer);
}

@HostApi(dartHostTestHandler: 'TestCameraControllerHostApi')
abstract class CameraControllerHostApi {
  void allocate(int id, Uint8List selectorBuffer);
  void free(int id);
  void bind(int id);
  void unbind(int id);
  bool getFlashlightState(int id);
  void setFlashlightState(int id, bool state);
  void setCameraSelector(int id, Uint8List selectorBuffer);
  void setImageAnalyzer(int id, int analyzerId);
  void clearImageAnalyzer(int id);
}

@FlutterApi()
abstract class CameraControllerFlutterApi {
  void notifyFlashlightState(int id, bool state);
}

@HostApi(dartHostTestHandler: 'TestImageAnalyzerHostApi')
abstract class ImageAnalyzerHostApi {
  void allocate(int id);
  void free(int id);
}

@FlutterApi()
abstract class ImageAnalyzerFutterApi {
  void notifyImage(int id, Uint8List imageBuffer);
}

@HostApi(dartHostTestHandler: 'TestMLAnalyzerHostApi')
abstract class MLAnalyzerHostApi {
  void allocate(int id);
  void free(int id);
  void analyze(int id, int imageId);
}

@FlutterApi()
abstract class MLAnalyzerFlutterApi {
  void notifyItems(int id, List<Uint8List> itemsBuffer);
}
