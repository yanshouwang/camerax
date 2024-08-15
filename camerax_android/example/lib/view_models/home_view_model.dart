import 'dart:async';

import 'package:camerax_android_example/models.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:hybrid_logging/hybrid_logging.dart';

import 'raw_pixels_analyzer.dart';

class HomeViewModel extends ViewModel with TypeLogger {
  final CameraController controller;
  CameraMode _mode;
  LensFacing _lensFacing;
  ZoomState? _zoomState;
  bool? _torchState;
  FlashMode? _flashMode;
  Uri? _savedUri;
  Recording? _recording;
  ImageWrapper? _imageWrapper;
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
  ImageWrapper? get imageWrapper => _imageWrapper;
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
    final resolutionSelector = ResolutionSelector(
      aspectRatioStrategy: AspectRatioStrategy.ratio16_9FallbackAutoStrategy,
      // resolutionStrategy: ResolutionStrategy.highestAvailableStrategy,
    );
    await controller.setImageAnalysisResolutionSelector(resolutionSelector);
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

  Future<void> bind() async {
    await controller.bind();
  }

  Future<void> unbind() async {
    await controller.unbind();
  }

  Future<void> toggleLensFacing() async {
    if (lensFacing == LensFacing.back) {
      await _setCameraSelector(CameraSelector.front);
    } else {
      await _setCameraSelector(CameraSelector.back);
    }
  }

  Future<void> _setCameraSelector(CameraSelector cameraSelector) async {
    final hasCamera = await controller.hasCamera(cameraSelector);
    if (!hasCamera) {
      return;
    }
    await controller.setCameraSelector(cameraSelector);
    _lensFacing = lensFacing;
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
      case CameraMode.rawValue:
        await controller
            .setImageAnalysisOutputImageFormat(OutputImageFormat.rgba_8888);
        final analyzer = RawPixelsAnalyzer(_onRawPixelsAnalyzed);
        await _setImageAnalysisAnalyzer(analyzer);
        break;
      case CameraMode.scanCode:
        await controller
            .setImageAnalysisOutputImageFormat(OutputImageFormat.yuv_420_888);
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
          targetCoordinateSystem: CoordinateSystem.viewReferenced,
          onAnalyzed: _onMLAnalyzed,
        );
        await _setImageAnalysisAnalyzer(analyzer);
        break;
      case CameraMode.scanFace:
        await controller
            .setImageAnalysisOutputImageFormat(OutputImageFormat.yuv_420_888);
        final analyzer = MLAnalyzer(
          types: [
            // Faces
            MLObjectType.face,
          ],
          targetCoordinateSystem: CoordinateSystem.viewReferenced,
          onAnalyzed: _onMLAnalyzed,
        );
        await _setImageAnalysisAnalyzer(analyzer);
        break;
      default:
        break;
    }
    _mode = mode;
    _imageWrapper = null;
    _items = [];
    notifyListeners();
  }

  void _onRawPixelsAnalyzed(ImageWrapper imageWrapper) {
    if (mode != CameraMode.rawValue) {
      return;
    }
    _imageWrapper = imageWrapper;
    notifyListeners();
  }

  void _onMLAnalyzed(List<MLObject> items) {
    if (mode != CameraMode.scanCode && mode != CameraMode.scanFace) {
      return;
    }
    _items = items;
    notifyListeners();
  }

  Future<void> _clearImageAnalysisAnalyzer() async {
    await controller.clearImageAnalysisAnalyzer();
  }

  Future<void> _setImageAnalysisAnalyzer(Analyzer analyzer) async {
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
