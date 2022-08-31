import 'dart:async';
import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pigeons.g.dart';
import 'models/proto.dart';

abstract class MLAnalyzerPigeon extends PlatformInterface {
  /// Constructs a [MLAnalyzerPigeon].
  MLAnalyzerPigeon() : super(token: _token);

  static final Object _token = Object();

  static MLAnalyzerPigeon _instance = _MLAnalyzerPigeon();

  /// The default instance of [MLAnalyzerPigeon] to use.
  ///
  /// Defaults to [_MLAnalyzerPigeon].
  static MLAnalyzerPigeon get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MLAnalyzerPigeon] when
  /// they register themselves.
  static set instance(MLAnalyzerPigeon instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Stream<MLRecognitionArguments> get recognitionStream;

  Future<void> create(String id);
  Future<void> analyze(String id, String imageProxyId);
}

class _MLAnalyzerPigeon extends MLAnalyzerPigeon
    implements MLAnalyzerFlutterPigeon {
  final MLAnalyzerHostPigeon host;
  final StreamController<MLRecognitionArguments> recognitionStreamController;

  _MLAnalyzerPigeon()
      : host = MLAnalyzerHostPigeon(),
        recognitionStreamController = StreamController.broadcast() {
    MLAnalyzerFlutterPigeon.setup(this);
  }

  @override
  Stream<MLRecognitionArguments> get recognitionStream =>
      recognitionStreamController.stream;

  @override
  Future<void> create(String id) {
    return host.create(id);
  }

  @override
  Future<void> analyze(String id, String imageProxyId) {
    return host.analyze(id, imageProxyId);
  }

  @override
  void onAnalyzed(String id, Uint8List recognitionBuffer) {
    final recognitionArguments = MLRecognitionArguments(
      id: id,
      recognition: MLRecognition.fromBuffer(recognitionBuffer),
    );
    recognitionStreamController.add(recognitionArguments);
  }
}
