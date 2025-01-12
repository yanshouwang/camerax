import 'dart:async';
import 'dart:math';

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

  CameraMode _mode;
  LensFacing _lensFacing;
  CameraInfo? _cameraInfo;
  CameraControl? _cameraControl;
  bool? _torchState;
  double? _minZoomRatio;
  double? _maxZoomRatio;
  double? _zoomRatio;
  int? _minExposureIndex;
  int? _maxExposureIndex;
  int? _exposureIndex;
  FlashMode? _flashMode;
  Uri? _savedUri;
  ImageModel? _imageModel;
  List<MlObject> _items;

  late final StreamSubscription _zoomStateSubscription;
  late final StreamSubscription _torchStateSubscription;

  HomeViewModel()
      : _permissionManager = PermissionManager(),
        controller = CameraController(),
        _mode = CameraMode.takePicture,
        _lensFacing = LensFacing.back,
        _items = [] {
    _initialize();
  }

  CameraMode get mode => _mode;
  LensFacing get lensFacing => _lensFacing;
  bool? get torchState => _torchState;
  double? get minZoomRatio => _minZoomRatio;
  double? get maxZoomRatio => _maxZoomRatio;
  double? get zoomRatio => _zoomRatio;
  int? get minExposureIndex => _minExposureIndex;
  int? get maxExposureIndex => _maxExposureIndex;
  int? get exposureIndex => _exposureIndex;
  FlashMode? get flashMode => _flashMode;
  Uri? get savedUri => _savedUri;
  bool get recording => _recording != null;
  ImageModel? get imageModel => _imageModel;
  List<MlObject> get items => _items;

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
          types: [
            // Barcodes
            MlObjectType.codabar,
            MlObjectType.code39,
            MlObjectType.code39Mode43,
            MlObjectType.code93,
            MlObjectType.code128,
            MlObjectType.ean8,
            MlObjectType.ean13,
            MlObjectType.gs1DataBar,
            MlObjectType.gs1DataBarExpanded,
            MlObjectType.gs1DataBarLimited,
            MlObjectType.interleave2of5,
            MlObjectType.itf14,
            MlObjectType.upcA,
            MlObjectType.upcE,
            // 2D Codes
            MlObjectType.aztec,
            MlObjectType.dataMatrix,
            MlObjectType.microPDF417,
            MlObjectType.microQR,
            MlObjectType.pdf417,
            MlObjectType.qr,
          ],
          targetCoordinateSystem: CoordinateSystem.viewReferenced,
          onAnalyzed: _onMLAnalyzed,
        );
        await _setMLAnalyzer(analyzer);
        break;
      case CameraMode.scanFace:
        final analyzer = MlKitAnalyzer(
          types: [
            // Faces
            MlObjectType.face,
          ],
          targetCoordinateSystem: CoordinateSystem.viewReferenced,
          onAnalyzed: _onMLAnalyzed,
        );
        await _setMLAnalyzer(analyzer);
        break;
    }
    _mode = mode;
    _imageModel = null;
    _items = [];
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
      listener: (event) async {
        logger.info('${event.runtimeType}');
        if (event is! VideoRecordFinalizeEvent) {
          return;
        }
        final error = await event.getError();
        if (error == null) {
          _savedUri = await event.getOutputUri();
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
        final minZoomRatio = await zoomState.getMinZoomRatio();
        final maxZoomRatio = await zoomState.getMaxZoomRatio();
        final zoomRatio = await zoomState.getZoomRatio();
        _minZoomRatio = minZoomRatio;
        _maxZoomRatio = maxZoomRatio;
        _zoomRatio = zoomRatio;
        notifyListeners();
        logger.info('zoomState: $minZoomRatio - $maxZoomRatio, $zoomRatio');
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
    final zoomState = await controller.getZoomState();
    if (zoomState != null) {
      final minZoomRatio = await zoomState.getMinZoomRatio();
      final maxZoomRatio = await zoomState.getMaxZoomRatio();
      final zoomRatio = await zoomState.getZoomRatio();
      _minZoomRatio = minZoomRatio;
      _maxZoomRatio = maxZoomRatio;
      _zoomRatio = zoomRatio;
    }
    final exposureState = await _cameraInfo?.getExposureState();
    if (exposureState != null) {
      final range = await exposureState.getExposureCompensationRange();
      final minExposureIndex = await range.getLower();
      final maxExposureIndex = await range.getUpper();
      final exposureIndex = await exposureState.getExposureCompensationIndex();
      _minExposureIndex = minExposureIndex;
      _maxExposureIndex = maxExposureIndex;
      _exposureIndex = exposureIndex;
    }
    final isPinchToZoomEnabled = await controller.isPinchToZoomEnabled();
    final isTapToFocusEnabled = await controller.isTapToFocusEnabled();
    // _flashMode = await controller.getImageCaptureFlashMode();
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

  void _onMLAnalyzed(List<MlObject> items) {
    if (mode != CameraMode.scanCode && mode != CameraMode.scanFace) {
      return;
    }
    _items = items;
    notifyListeners();
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
