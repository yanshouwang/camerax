import 'dart:async';
import 'dart:io';

import 'package:camerax/camerax.dart';
import 'package:camerax_example/models.dart';
import 'package:clover/clover.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'raw_pixels_analyzer.dart';

class HomeViewModel extends ViewModel with TypeLogger {
  final PermissionManager _permissionManager;
  final CameraController _controller;
  final BarcodeScanner _barcodeScanner;
  final FaceDetector _faceDetector;

  CameraMode _mode;
  LensFacing _lensFacing;
  FlashMode? _flashMode;
  CameraControl? _cameraControl;
  CameraInfo? _cameraInfo;
  ExposureState? _exposureState;
  Uri? _savedUri;
  ImageModel? _imageModel;
  List<Barcode> _barcodes;
  List<Face> _faces;

  HomeViewModel()
      : _permissionManager = PermissionManager(),
        _controller = CameraController(),
        _barcodeScanner = BarcodeScanner(),
        _faceDetector = FaceDetector(),
        _mode = CameraMode.takePicture,
        _lensFacing = LensFacing.back,
        _barcodes = [],
        _faces = [] {
    _initialize();
  }

  CameraController get controller => _controller;
  CameraMode get mode => _mode;
  LensFacing get lensFacing => _lensFacing;
  FlashMode? get flashMode => _flashMode;
  ExposureState? get exposureState => _exposureState;
  Uri? get savedUri => _savedUri;
  bool get recording => _recording != null;
  ImageModel? get imageModel => _imageModel;
  List<Barcode> get barcodes => _barcodes;
  List<Face> get faces => _faces;

  Future<void> bind() async {
    await controller.bind();
    // TODO: How to wait until camera really opened.
    const duration = Duration(seconds: 1);
    await Future.delayed(duration);
    _cameraControl = await controller.getCameraControl();
    _cameraInfo = await controller.getCameraInfo();
    _exposureState = await _cameraInfo?.getExposureState();
    notifyListeners();
  }

  Future<void> unbind() async {
    await controller.unbind();
    _cameraControl = null;
    _cameraInfo?.dispose();
    _cameraInfo = null;
    _exposureState = null;
    notifyListeners();
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
    final torchState = _controller.torchState;
    if (torchState == null) {
      throw ArgumentError.notNull();
    }
    final enableTorch = torchState == TorchState.off;
    await controller.enableTorch(enableTorch);
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
    final file = File(filePath);
    final options = OutputFileOptions(
      file: file,
    );
    await controller.takePictureToFile(
      options,
      onImageSaved: (outputFileResults) {
        _savedUri = outputFileResults.savedUri;
        notifyListeners();
      },
      onError: (exception) {
        logger.info('takePicture failed, $exception');
      },
    );
  }

  Recording? _recording;

  Future<void> startRecording() async {
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      throw ArgumentError.notNull('directory');
    }
    final filePath = path.join(directory.path,
        'MOV_${DateTime.timestamp().millisecondsSinceEpoch}.MOV');
    final file = File(filePath);
    final options = FileOutputOptions(file: file);
    _recording = await controller.startRecording(
      options,
      audioConfig: AudioConfig.audioDisabled,
      listener: (event) {
        logger.info('${event.runtimeType}');
        if (event is! VideoRecordFinalizeEvent) {
          return;
        }
        final error = event.cause;
        final results = event.outputResults;
        if (error == null) {
          _savedUri = results?.outputUri;
        } else {
          logger.info('startRecording failed, $error');
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
    _clearImageAnalysisAnalyzer();
    unbind();
    _controller.dispose();
    super.dispose();
  }
}