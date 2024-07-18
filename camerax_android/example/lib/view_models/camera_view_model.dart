import 'dart:async';
import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:hybrid_logging/hybrid_logging.dart';

class CameraViewModel extends ViewModel
    with TypeLogger
    implements ImageAnalyzer {
  final CameraController controller;
  LensFacing _lensFacing;
  ZoomState? _zoomState;
  bool? _torchState;
  FlashMode? _flashMode;
  Uri? _savedUri;
  Image? _image;

  late final StreamSubscription _zoomStateSubscription;
  late final StreamSubscription _torchStateSubscription;

  CameraViewModel()
      : controller = CameraController(),
        _lensFacing = LensFacing.back,
        _zoomState = null,
        _flashMode = null,
        _savedUri = null {
    _initialize();
  }

  LensFacing get lensFacing => _lensFacing;
  ZoomState? get zoomState => _zoomState;
  bool? get torchState => _torchState;
  FlashMode? get flashMode => _flashMode;
  Uri? get savedUri => _savedUri;
  Image? get image => _image;

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
      throw StateError('Unauthorized.');
    }
    await controller.requestAuthorization(
      type: AuthorizationType.audio,
    );
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
    await controller.setImageAnalyzer(this);
    await controller.bind();
  }

  @override
  void analyze(ImageProxy image) {
    logger.info(image);
    decodeImageFromPixels(
      image.data,
      image.width,
      image.height,
      PixelFormat.rgba8888,
      (value) async {
        _image = value;
        notifyListeners();
        await image.close();
      },
    );
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
    _savedUri = await controller.takePictureToAlbum();
    notifyListeners();
  }

  @override
  void dispose() {
    controller.clearImageAnalyzer();
    controller.unbind();
    _zoomStateSubscription.cancel();
    _torchStateSubscription.cancel();
    super.dispose();
  }
}
