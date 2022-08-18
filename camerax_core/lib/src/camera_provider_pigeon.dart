import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'messages.dart';
import 'pigeons.dart';

abstract class CameraProviderPigeon extends PlatformInterface {
  /// Constructs a [CameraProviderPigeon].
  CameraProviderPigeon() : super(token: _token);

  static final Object _token = Object();

  static CameraProviderPigeon _instance = _CameraProviderPigeon();

  /// The default instance of [CameraProviderPigeon] to use.
  ///
  /// Defaults to [_CameraProviderPigeon].
  static CameraProviderPigeon get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraProviderPigeon] when
  /// they register themselves.
  static set instance(CameraProviderPigeon instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Camera> bind({
    required CameraSelector selector,
    required List<UseCase> useCases,
  });

  Future<void> unbind({required List<UseCase> useCases});

  Future<void> unbindAll();
}

class _CameraProviderPigeon extends CameraProviderPigeon {
  final CameraProviderHostPigeon hostPigeon;

  _CameraProviderPigeon() : hostPigeon = CameraProviderHostPigeon();

  @override
  Future<Camera> bind({
    required CameraSelector selector,
    required List<UseCase> useCases,
  }) {
    final cameraSelectorByteArray = selector.writeToBuffer();
    final useCaseByteArrays =
        useCases.map((useCase) => useCase.writeToBuffer()).toList();
    return hostPigeon
        .bind(cameraSelectorByteArray, useCaseByteArrays)
        .then((cameraByteArray) => Camera());
  }

  @override
  Future<void> unbind({required List<UseCase> useCases}) {
    final useCaseByteArrays =
        useCases.map((useCase) => useCase.writeToBuffer()).toList();
    return hostPigeon.unbind(useCaseByteArrays);
  }

  @override
  Future<void> unbindAll() {
    return hostPigeon.unbindAll();
  }
}
