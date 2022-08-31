import 'dart:async';
import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pigeons.g.dart';
import 'models/proto.dart';

abstract class ImageAnalyzerPigeon extends PlatformInterface {
  /// Constructs a [CameraControllerPigeon].
  ImageAnalyzerPigeon() : super(token: _token);

  static final Object _token = Object();

  static ImageAnalyzerPigeon _instance = _ImageAnalyzerPigeon();

  /// The default instance of [ImageAnalyzerPigeon] to use.
  ///
  /// Defaults to [_ImageAnalyzerPigeon].
  static ImageAnalyzerPigeon get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ImageAnalyzerPigeon] when
  /// they register themselves.
  static set instance(ImageAnalyzerPigeon instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Stream<ImageProxyArguments> get imageProxyStream;

  Future<void> create(String id);
}

class _ImageAnalyzerPigeon extends ImageAnalyzerPigeon
    implements ImageAnalyzerFutterPigeon {
  final ImageAnalyzerHostPigeon host;
  final StreamController<ImageProxyArguments> imageProxyStreamController;

  _ImageAnalyzerPigeon()
      : host = ImageAnalyzerHostPigeon(),
        imageProxyStreamController = StreamController();

  @override
  Stream<ImageProxyArguments> get imageProxyStream =>
      imageProxyStreamController.stream;

  @override
  Future<void> create(String id) {
    return host.create(id);
  }

  @override
  void onAnalyzed(String id, Uint8List imageProxyBuffer) {
    final iamgeProxyArguments = ImageProxyArguments(
      id: id,
      imageProxy: ImageProxy.fromBuffer(imageProxyBuffer),
    );
    imageProxyStreamController.add(iamgeProxyArguments);
  }
}
