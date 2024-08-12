import 'dart:async';

import 'package:camerax_android_example/models.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:hybrid_logging/hybrid_logging.dart';

class HomeViewModel extends ViewModel with TypeLogger {
  final CameraController controller;
  CameraMode _mode;
  LensFacing _lensFacing;
  ZoomState? _zoomState;
  bool? _torchState;
  FlashMode? _flashMode;
  Uri? _savedUri;
  Recording? _recording;
  ImageProxy? _imageProxy;
  List<MLObject> _items;

  late final StreamSubscription _zoomStateSubscription;
  late final StreamSubscription _torchStateSubscription;

  HomeViewModel()
      : controller = CameraController(),
        _mode = CameraMode.takePicture,
        _lensFacing = LensFacing.back,
        _zoomState = null,
        _flashMode = null,
        _savedUri = null,
        _recording = null,
        _items = [] {
    _initialize();
  }

  CameraMode get mode => _mode;
  LensFacing get lensFacing => _lensFacing;
  ZoomState? get zoomState => _zoomState;
  bool? get torchState => _torchState;
  FlashMode? get flashMode => _flashMode;
  Uri? get savedUri => _savedUri;
  bool get recording => _recording != null;
  ImageProxy? get imageProxy => _imageProxy;
  List<MLObject> get items => _items;

  void _initialize() async {
    _zoomStateSubscription = controller.zoomStateChanged.listen((zoomState) {
      logger.info(
          'zoomStateChanged ${zoomState?.minZoomRatio}, ${zoomState?.maxZoomRatio}, ${zoomState?.linearZoom}, ${zoomState?.zoomRatio}');
      _zoomState = zoomState;
      notifyListeners();
    });
    _torchStateSubscription = controller.torchStateChanged.listen((torchState) {
      logger.info('torchStateChanged $torchState');
      _torchState = torchState;
      notifyListeners();
    });
    final videoAuthorized = await controller.requestAuthorization(
      type: AuthorizationType.video,
    );
    final audioAuthorized = await controller.requestAuthorization(
      type: AuthorizationType.audio,
    );
    if (!videoAuthorized || !audioAuthorized) {
      throw StateError('requestAuthorization failed.');
    }
    await controller.setCameraSelector(CameraSelector.back);
    _zoomState = await controller.getZoomState();
    _torchState = await controller.getTorchState();
    _flashMode = await controller.getImageCaptureFlashMode();
    final isPinchToZoomEnabled = await controller.isPinchToZoomEnabled();
    final isTapToFocusEnabled = await controller.isTapToFocusEnabled();
    logger.info(
        '''zoomState: ${zoomState?.minZoomRatio}, ${zoomState?.maxZoomRatio}, ${zoomState?.linearZoom}, ${zoomState?.zoomRatio}
torchState: $torchState
flashMode: $flashMode
isPinchToZoomEnabled: $isPinchToZoomEnabled
isTapToFocusEnabled: $isTapToFocusEnabled''');
    notifyListeners();
    await bind();
  }

  void _onAnalyzed(List<MLObject> items) {
    if (mode == CameraMode.takePicture || mode == CameraMode.recordVideo) {
      return;
    }
    _items = items;
    notifyListeners();
  }

  Future<void> bind() async {
    await controller.bind();
  }

  Future<void> unbind() async {
    await controller.unbind();
  }

  Future<void> toggleLensFacing() async {
    final cameraSelector = lensFacing == LensFacing.back
        ? CameraSelector.front
        : CameraSelector.back;
    final hasCamera = await controller.hasCamera(cameraSelector);
    if (!hasCamera) {
      return;
    }
    await controller.setCameraSelector(cameraSelector);
    _lensFacing = cameraSelector.lensFacing;
    notifyListeners();
  }

  Future<void> setZoomRatio(double zoomRatio) async {
    await controller.setZoomRatio(zoomRatio);
  }

  Future<void> toggleTorchState() async {
    final enableTorch = torchState;
    if (enableTorch == null) {
      throw ArgumentError.notNull();
    }
    await controller.enableTorch(!enableTorch);
  }

  Future<void> setFlashMode(FlashMode flashMode) async {
    await controller.setImageCaptureFlashMode(flashMode);
    _flashMode = await controller.getImageCaptureFlashMode();
    notifyListeners();
  }

  Future<void> takePicture() async {
    final authorized = await controller.requestAuthorization(
      type: AuthorizationType.album,
    );
    if (!authorized) {
      throw StateError('requestAuthorization failed.');
    }
    _savedUri = await controller.takePictureToAlbum();
    notifyListeners();
  }

  Future<void> startRecording() async {
    final recording = _recording;
    if (recording != null) {
      throw StateError('Recording.');
    }
    final authorized = await controller.requestAuthorization(
      type: AuthorizationType.album,
    );
    if (!authorized) {
      throw StateError('requestAuthorization failed.');
    }
    _recording = await controller.startRecording(
      enableAudio: true,
      listener: (event) {
        if (event is! VideoRecordFinalizeEvent) {
          logger.info('${event.runtimeType}');
          return;
        }
        final error = event.error;
        if (error == null) {
          _savedUri = event.uri;
          notifyListeners();
        } else {
          logger.info('Record Video failed $error.');
        }
      },
    );
    notifyListeners();
  }

  void stopRecording() {
    final recording = _recording;
    if (recording == null) {
      throw StateError('Not recording.');
    }
    recording.stop();
    _recording = null;
    notifyListeners();
  }

  Future<void> setMode(CameraMode mode) async {
    switch (mode) {
      case CameraMode.takePicture:
        await _clearImageAnalysisAnalyzer();
        break;
      case CameraMode.recordVideo:
        await _clearImageAnalysisAnalyzer();
        break;
      case CameraMode.scanCode:
        final analyzer = MLAnalyzer(
          types: [
            // Barcodes
            MLObjectType.codabar,
            MLObjectType.code39,
            MLObjectType.code39Mode43,
            MLObjectType.code93,
            MLObjectType.code128,
            MLObjectType.ean8,
            MLObjectType.ean13,
            MLObjectType.gs1DataBar,
            MLObjectType.gs1DataBarExpanded,
            MLObjectType.gs1DataBarLimited,
            MLObjectType.interleave2of5,
            MLObjectType.itf14,
            MLObjectType.upcA,
            MLObjectType.upcE,
            // 2D Codes
            MLObjectType.aztec,
            MLObjectType.dataMatrix,
            MLObjectType.microPDF417,
            MLObjectType.microQR,
            MLObjectType.pdf417,
            MLObjectType.qr,
          ],
          onAnalyzed: _onAnalyzed,
        );
        await _setImageAnalysisAnalyzer(analyzer);
        break;
      case CameraMode.scanFace:
        final analyzer = MLAnalyzer(
          types: [
            // Faces
            MLObjectType.face,
          ],
          onAnalyzed: _onAnalyzed,
        );
        await _setImageAnalysisAnalyzer(analyzer);
        break;
      default:
        break;
    }
    _mode = mode;
    notifyListeners();
  }

  Future<void> _clearImageAnalysisAnalyzer() async {
    await controller.clearImageAnalysisAnalyzer();
    _imageProxy = null;
    _items = [];
    notifyListeners();
  }

  Future<void> _setImageAnalysisAnalyzer(ImageAnalyzer analyzer) async {
    await controller.unbind();
    await controller.setImageAnalysisAnalyzer(analyzer);
    await controller.bind();
  }

  @override
  void dispose() {
    controller.clearImageAnalysisAnalyzer();
    controller.unbind();
    _zoomStateSubscription.cancel();
    _torchStateSubscription.cancel();
    super.dispose();
  }
}
