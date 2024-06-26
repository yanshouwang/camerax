import 'dart:async';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:clover/clover.dart';
import 'package:hybrid_logging/hybrid_logging.dart';

class HomeViewModel extends ViewModel with TypeLogger {
  final CameraController cameraController;
  LensFacing _lensFacing;
  ZoomState? _zoomState;

  late final StreamSubscription _zoomStateSubscription;

  HomeViewModel()
      : cameraController = CameraController(),
        _lensFacing = LensFacing.back,
        _zoomState = null {
    _initialize();
  }

  LensFacing get lensFacing => _lensFacing;
  ZoomState? get zoomState => _zoomState;

  void _initialize() async {
    _zoomStateSubscription =
        cameraController.zoomStateChanged.listen((zoomState) {
      logger.info(
          'zoomStateChanged ${zoomState?.minZoomRatio}, ${zoomState?.maxZoomRatio}, ${zoomState?.linearZoom}, ${zoomState?.zoomRatio}');
      _zoomState = zoomState;
      notifyListeners();
    });
    await cameraController.requestPermissions();
    await cameraController.setCameraSelector(CameraSelector.back);
    _zoomState = await cameraController.getZoomState();
    final isPinchToZoomEnabled = await cameraController.isPinchToZoomEnabled();
    final isTapToFocusEnabled = await cameraController.isTapToFocusEnabled();
    logger.info(
        '''zoomState: ${zoomState?.minZoomRatio}, ${zoomState?.maxZoomRatio}, ${zoomState?.linearZoom}, ${zoomState?.zoomRatio}
isPinchToZoomEnabled: $isPinchToZoomEnabled
isTapToFocusEnabled: $isTapToFocusEnabled''');
    notifyListeners();
    await cameraController.bind();
  }

  Future<void> toggleLensFacing() async {
    final cameraSelector = lensFacing == LensFacing.back
        ? CameraSelector.front
        : CameraSelector.back;
    final hasCamera = await cameraController.hasCamera(cameraSelector);
    if (!hasCamera) {
      return;
    }
    await cameraController.setCameraSelector(cameraSelector);
    _lensFacing = cameraSelector.lensFacing;
    notifyListeners();
  }

  Future<void> setZoomRatio(double zoomRatio) async {
    await cameraController.setZoomRatio(zoomRatio);
  }

  @override
  void dispose() {
    cameraController.unbind();
    _zoomStateSubscription.cancel();
    super.dispose();
  }
}
