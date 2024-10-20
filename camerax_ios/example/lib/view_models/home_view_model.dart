import 'dart:async';

import 'package:camerax_ios_example/models.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'raw_pixels_analyzer.dart';

class HomeViewModel extends ViewModel with TypeLogger {
  final CameraController controller;
  CameraMode _mode;
  LensFacing _lensFacing;
  ZoomState? _zoomState;
  bool? _torchState;
  FlashMode? _flashMode;
  Uri? _savedUri;
  bool _recording;
  ImageModel? _imageModel;

  late final StreamSubscription _zoomStateSubscription;
  late final StreamSubscription _torchStateSubscription;

  HomeViewModel()
      : controller = CameraController(),
        _mode = CameraMode.takePicture,
        _lensFacing = LensFacing.back,
        _recording = false {
    _initialize();
  }

  CameraMode get mode => _mode;
  LensFacing get lensFacing => _lensFacing;
  ZoomState? get zoomState => _zoomState;
  bool? get torchState => _torchState;
  FlashMode? get flashMode => _flashMode;
  Uri? get savedUri => _savedUri;
  bool get recording => _recording;
  ImageModel? get imageModel => _imageModel;

  Future<void> bind() async {
    await controller.bind();
  }

  Future<void> unbind() async {
    await controller.unbind();
  }

  Future<void> setMode(CameraMode mode) async {
    switch (mode) {
      case CameraMode.takePicture:
      case CameraMode.recordVideo:
        await _clearImageAnalysisAnalyzer();
        break;
      case CameraMode.rawValue:
        await _setRawAnalyzer();
        break;
      case CameraMode.scanCode:
        // final analyzer = MLAnalyzer(
        //   types: [
        //     // Barcodes
        //     MLObjectType.codabar,
        //     MLObjectType.code39,
        //     MLObjectType.code39Mode43,
        //     MLObjectType.code93,
        //     MLObjectType.code128,
        //     MLObjectType.ean8,
        //     MLObjectType.ean13,
        //     MLObjectType.gs1DataBar,
        //     MLObjectType.gs1DataBarExpanded,
        //     MLObjectType.gs1DataBarLimited,
        //     MLObjectType.interleave2of5,
        //     MLObjectType.itf14,
        //     MLObjectType.upcA,
        //     MLObjectType.upcE,
        //     // 2D Codes
        //     MLObjectType.aztec,
        //     MLObjectType.dataMatrix,
        //     MLObjectType.microPDF417,
        //     MLObjectType.microQR,
        //     MLObjectType.pdf417,
        //     MLObjectType.qr,
        //   ],
        //   targetCoordinateSystem: CoordinateSystem.viewReferenced,
        //   onAnalyzed: _onMLAnalyzed,
        // );
        // await _setMLAnalyzer(analyzer);
        break;
      case CameraMode.scanFace:
        // final analyzer = MLAnalyzer(
        //   types: [
        //     // Faces
        //     MLObjectType.face,
        //   ],
        //   targetCoordinateSystem: CoordinateSystem.viewReferenced,
        //   onAnalyzed: _onMLAnalyzed,
        // );
        // await _setMLAnalyzer(analyzer);
        break;
    }
    _mode = mode;
    _imageModel = null;
    // _items = [];
    notifyListeners();
  }

  Future<void> toggleLensFacing() async {
    if (lensFacing == LensFacing.back) {
      await _setCameraSelector(CameraSelector.front);
      _lensFacing = LensFacing.front;
    } else {
      await _setCameraSelector(CameraSelector.back);
      _lensFacing = LensFacing.back;
    }
    notifyListeners();
  }

  Future<void> setZoomRatio(double zoomRatio) async {
    await controller.setZoomRatio(zoomRatio);
  }

  Future<void> toggleTorchState() async {
    final enabled = torchState;
    if (enabled == null) {
      throw ArgumentError.notNull();
    }
    await controller.enableTorch(!enabled);
  }

  Future<void> setFlashMode(FlashMode flashMode) async {
    await controller.setImageCaptureFlashMode(flashMode);
    _flashMode = await controller.getImageCaptureFlashMode();
    notifyListeners();
  }

  Future<void> takePicture() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = path.join(directory.path,
        'IMG_${DateTime.timestamp().millisecondsSinceEpoch}.JPG');
    final uri = Uri.file(filePath);
    _savedUri = await controller.takePicture(
      uri: uri,
    );
    notifyListeners();
  }

  Future<void> startRecording() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = path.join(directory.path,
        'MOV_${DateTime.timestamp().millisecondsSinceEpoch}.MOV');
    final uri = Uri.file(filePath);
    await controller.startRecording(
      uri: uri,
      enableAudio: true,
      listener: (event) {
        logger.info('${event.runtimeType}');
        if (event is! VideoRecordFinalizeEvent) {
          return;
        }
        final error = event.error;
        if (error == null) {
          _savedUri = event.savedUri;
        } else {
          logger.info('Record Video failed $error.');
        }
        _recording = false;
        notifyListeners();
      },
    );
    _recording = true;
    notifyListeners();
  }

  Future<void> stopRecording() async {
    await controller.stopRecording();
    _recording = false;
    notifyListeners();
  }

  void _initialize() async {
    _zoomStateSubscription = controller.zoomStateChanged.listen((zoomState) {
      logger.info(
          'zoomStateChanged ${zoomState?.minZoomRatio}, ${zoomState?.maxZoomRatio}, ${zoomState?.zoomRatio}, ${zoomState?.linearZoom}');
      _zoomState = zoomState;
      notifyListeners();
    });
    _torchStateSubscription = controller.torchStateChanged.listen((torchState) {
      logger.info('torchStateChanged $torchState');
      _torchState = torchState;
      notifyListeners();
    });
    for (var type in AuthorizationType.values) {
      var authorized = await controller.checkAuthorization(type: type);
      if (authorized) {
        continue;
      }
      authorized = await controller.requestAuthorization(type: type);
      if (authorized) {
        continue;
      }
      logger.warning('$type is unahthorized.');
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

  Future<void> _setCameraSelector(CameraSelector cameraSelector) async {
    final hasCamera = await controller.hasCamera(cameraSelector);
    if (!hasCamera) {
      return;
    }
    await controller.setCameraSelector(cameraSelector);
    _lensFacing = lensFacing;
    notifyListeners();
  }

  Future<void> _setRawAnalyzer() async {
    await controller.unbind();
    await controller.setImageAnalysisOutputImageFormat(ImageFormat.rgba_8888);
    final analyzer = RawPixelsAnalyzer(_onRawPixelsAnalyzed);
    await controller.setImageAnalysisAnalyzer(analyzer);
    await controller.bind();
  }

  void _onRawPixelsAnalyzed(ImageModel imageModel) {
    if (mode != CameraMode.rawValue) {
      return;
    }
    _imageModel = imageModel;
    notifyListeners();
  }

  Future<void> _clearImageAnalysisAnalyzer() async {
    await controller.clearImageAnalysisAnalyzer();
  }

  @override
  void dispose() {
    controller.unbind();
    _zoomStateSubscription.cancel();
    _torchStateSubscription.cancel();
    super.dispose();
  }
}