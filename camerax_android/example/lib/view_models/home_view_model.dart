import 'dart:async';

import 'package:camerax_android_example/models.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'raw_pixels_analyzer.dart';

class HomeViewModel extends ViewModel with TypeLogger {
  final PermissionManager _permissionManager;
  final CameraController controller;
  final BarcodeScanner _barcodeScanner;
  final FaceDetector _faceDetector;

  CameraMode _mode;
  LensFacing _lensFacing;
  CameraInfo? _cameraInfo;
  CameraControl? _cameraControl;
  bool? _torchState;
  ZoomState? _zoomState;
  ExposureState? _exposureState;
  FlashMode? _flashMode;
  Uri? _savedUri;
  ImageModel? _imageModel;
  List<Barcode> _barcodes;
  List<Face> _faces;

  late final StreamSubscription _zoomStateSubscription;
  late final StreamSubscription _torchStateSubscription;

  HomeViewModel()
      : _permissionManager = PermissionManager(),
        controller = CameraController(),
        _barcodeScanner = BarcodeScanner(),
        _faceDetector = FaceDetector(),
        _mode = CameraMode.takePicture,
        _lensFacing = LensFacing.back,
        _barcodes = [],
        _faces = [] {
    _initialize();
  }

  CameraMode get mode => _mode;
  LensFacing get lensFacing => _lensFacing;
  bool? get torchState => _torchState;
  ZoomState? get zoomState => _zoomState;
  ExposureState? get exposureState => _exposureState;
  FlashMode? get flashMode => _flashMode;
  Uri? get savedUri => _savedUri;
  bool get recording => _recording != null;
  ImageModel? get imageModel => _imageModel;
  List<Barcode> get barcodes => _barcodes;
  List<Face> get faces => _faces;

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
        final analyzer = MlKitAnalyzer(
          detectors: [
            _barcodeScanner,
          ],
          targetCoordinateSystem: CoordinateSystem.viewReferenced,
          consumer: _extractML,
        );
        await _setMLAnalyzer(analyzer);
        break;
      case CameraMode.scanFace:
        final analyzer = MlKitAnalyzer(
          detectors: [
            _faceDetector,
          ],
          targetCoordinateSystem: CoordinateSystem.viewReferenced,
          consumer: _extractML,
        );
        await _setMLAnalyzer(analyzer);
        break;
    }
    _mode = mode;
    _imageModel = null;
    _barcodes = [];
    _faces = [];
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

  Future<void> toggleTorchState() async {
    final enableTorch = torchState;
    if (enableTorch == null) {
      throw ArgumentError.notNull();
    }
    await controller.enableTorch(!enableTorch);
  }

  Future<void> setZoomRatio(double zoomRatio) async {
    await controller.setZoomRatio(zoomRatio);
  }

  Future<void> setExposure(int value) async {
    final cameraControl = ArgumentError.checkNotNull(_cameraControl);
    final exposureIndex =
        await cameraControl.setExposureCompensationIndex(value);
    logger.info('setExposureCompensationIndex: $exposureIndex');
    // _exposureIndex = exposureIndex;
    // notifyListeners();
  }

  Future<void> setFlashMode(FlashMode flashMode) async {
    await controller.setImageCaptureFlashMode(flashMode);
    _flashMode = await controller.getImageCaptureFlashMode();
    notifyListeners();
  }

  Future<void> takePicture() async {
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      throw ArgumentError.notNull('directory');
    }
    final filePath = path.join(directory.path,
        'IMG_${DateTime.timestamp().millisecondsSinceEpoch}.JPG');
    final uri = Uri.file(filePath);
    _savedUri = await controller.takePicture(uri);
    notifyListeners();
  }

  Recording? _recording;

  Future<void> startRecording() async {
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      throw ArgumentError.notNull('directory');
    }
    final filePath = path.join(directory.path,
        'MOV_${DateTime.timestamp().millisecondsSinceEpoch}.MOV');
    final uri = Uri.file(filePath);
    _recording = await controller.startRecording(
      uri: uri,
      enableAudio: true,
      listener: (event) {
        logger.info('${event.runtimeType}');
        if (event is! VideoRecordFinalizeEvent) {
          return;
        }
        final error = event.error;
        if (error == null) {
          _savedUri = event.outputUri;
        } else {
          logger.info('Record Video failed $error.');
        }
        _recording = null;
        notifyListeners();
      },
    );
    notifyListeners();
  }

  void stopRecording() {
    _recording?.stop();
  }

  void _initialize() async {
    _torchStateSubscription = controller.torchStateChanged.listen(
      (torchState) {
        logger.info('torchStateChanged $torchState');
        _torchState = torchState;
        notifyListeners();
      },
      onError: (e) {
        logger.warning('torchStateChanged error: $e');
      },
      onDone: () {
        logger.info('torchStateChanged done');
      },
    );
    _zoomStateSubscription = controller.zoomStateChanged.listen(
      (zoomState) async {
        logger.info('zoomState: $zoomState');
        _zoomState = zoomState;
        notifyListeners();
      },
      onError: (e) {
        logger.warning('zoomStateChanged error: $e');
      },
      onDone: () {
        logger.info('zoomStateChanged done');
      },
    );
    var isGranted =
        await _permissionManager.checkPermission(Permission.album) &&
            await _permissionManager.checkPermission(Permission.audio) &&
            await _permissionManager.checkPermission(Permission.video);
    if (!isGranted) {
      isGranted = await _permissionManager.requestPermissions([
        Permission.album,
        Permission.audio,
        Permission.video,
      ]);
    }
    if (!isGranted) {
      throw StateError('requestPermissions failed.');
    }
    await controller.initialize();
    await controller.setCameraSelector(CameraSelector.back);
    await bind();
    // TODO: How to wait until camera really opened.
    const duration = Duration(seconds: 1);
    await Future.delayed(duration);
    _cameraInfo = await controller.getCameraInfo();
    _cameraControl = await controller.getCameraControl();
    _torchState = await controller.getTorchState();
    _zoomState = await controller.getZoomState();
    _exposureState = await _cameraInfo?.getExposureState();
    _flashMode = await controller.getImageCaptureFlashMode();
    final isPinchToZoomEnabled = await controller.isPinchToZoomEnabled();
    final isTapToFocusEnabled = await controller.isTapToFocusEnabled();
    logger.info('''cameraInfo: $_cameraInfo
cameraControl: $_cameraControl
torchState: $torchState
zoomState: $zoomState
exposureState: $exposureState
flashMode: $flashMode
isPinchToZoomEnabled: $isPinchToZoomEnabled
isTapToFocusEnabled: $isTapToFocusEnabled''');
    notifyListeners();
  }

  Future<void> _setCameraSelector(CameraSelector cameraSelector) async {
    final hasCamera = await controller.hasCamera(cameraSelector);
    if (!hasCamera) {
      return;
    }
    await controller.setCameraSelector(cameraSelector);
  }

  Future<void> _setRawAnalyzer() async {
    await controller.unbind();
    await controller.setImageAnalysisOutputImageFormat(ImageFormat.rgba8888);
    final analyzer = rawPixelsAnalyzer(_onRawPixelsAnalyzed);
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

  Future<void> _setMLAnalyzer(MlKitAnalyzer analyzer) async {
    await controller.unbind();
    await controller.setImageAnalysisOutputImageFormat(ImageFormat.yuv420_888);
    await controller.setImageAnalysisAnalyzer(analyzer);
    await controller.bind();
  }

  void _extractML(MlKitAnalyzerResult result) async {
    switch (mode) {
      case CameraMode.scanCode:
        final barcodes = await result.getValue(_barcodeScanner);
        _barcodes = barcodes ?? [];
        notifyListeners();
        break;
      case CameraMode.scanFace:
        final faces = await result.getValue(_faceDetector);
        _faces = faces ?? [];
        notifyListeners();
        break;
      default:
    }
  }

  Future<void> _clearImageAnalysisAnalyzer() async {
    await controller.clearImageAnalysisAnalyzer();
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
